import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../failure/errors.dart';
import '../../models/conversation_model.dart';
import '../../models/message_model.dart';
import '../../utils/notification_helper.dart';
import 'messaging_repo.dart';

class MessagingRepoImpl implements MessagingRepo {
  final FirebaseFirestore firestore;

  MessagingRepoImpl({required this.firestore});

  /// Collection references
  CollectionReference get _conversationsCollection => firestore.collection('conversations');
  CollectionReference get _messagesCollection => firestore.collection('messages');
  CollectionReference get _usersCollection => firestore.collection('users');

  /// Generate a unique conversation ID for two users
  String _generateConversationId(String userId1, String userId2) {
    final sortedIds = [userId1, userId2]..sort();
    return '${sortedIds[0]}_${sortedIds[1]}';
  }

  @override
  Future<Either<Failure, MessageModel>> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
    MessageType type = MessageType.text,
  }) async {
    try {
      // Get or create conversation
      final conversationResult = await getOrCreateConversation(
        userId1: senderId,
        userId2: receiverId,
      );

      return conversationResult.fold(
        (failure) => Left(failure),
        (conversation) async {
          final timestamp = DateTime.now();

          // Create message
          final message = MessageModel(
            id: '', // Will be set by Firestore
            conversationId: conversation.id,
            senderId: senderId,
            receiverId: receiverId,
            content: content,
            timestamp: timestamp,
            isRead: false,
            type: type,
          );

          // Add message to messages collection
          final messageDoc = await _messagesCollection
              .doc(conversation.id)
              .collection('messages')
              .add(message.toMap());

          // Update conversation with last message
          await _conversationsCollection.doc(conversation.id).update({
            'lastMessage': content,
            'lastMessageTime': Timestamp.fromDate(timestamp),
            'lastMessageSenderId': senderId,
            'unreadCount.$receiverId': FieldValue.increment(1),
          });

          // Create notification for the receiver
          try {
            // Get sender's information
            final senderDoc = await _usersCollection.doc(senderId).get();
            if (senderDoc.exists) {
              final senderData = senderDoc.data() as Map<String, dynamic>;
              final firstName = senderData['firstName'] ?? '';
              final lastName = senderData['lastName'] ?? '';
              final senderName = '$firstName $lastName'.trim().isEmpty
                  ? 'Someone'
                  : '$firstName $lastName'.trim();
              final senderImage = senderData['photoUrl'] ?? '';

              // Create a preview of the message (truncate if too long)
              final messagePreview = content.length > 50
                  ? '${content.substring(0, 50)}...'
                  : content;

              // Create message notification
              await NotificationHelper.createMessageNotification(
                receiverId: receiverId,
                senderId: senderId,
                senderName: senderName,
                senderImage: senderImage,
                messagePreview: messagePreview,
                conversationId: conversation.id,
              );
            }
          } catch (e) {
            // Log error but don't fail the send message action
            print('Failed to create message notification: ${e.toString()}');
          }

          // Return message with generated ID
          return Right(message.copyWith(id: messageDoc.id));
        },
      );
    } catch (e) {
      return Left(Failure(message: 'Failed to send message: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ConversationModel>> getOrCreateConversation({
    required String userId1,
    required String userId2,
  }) async {
    try {
      final conversationId = _generateConversationId(userId1, userId2);
      final conversationDoc = await _conversationsCollection.doc(conversationId).get();

      if (conversationDoc.exists) {
        // Conversation exists, return it
        return Right(ConversationModel.fromFirestore(conversationDoc));
      } else {
        // Create new conversation
        final newConversation = ConversationModel(
          id: conversationId,
          participantIds: [userId1, userId2],
          lastMessage: '',
          lastMessageTime: DateTime.now(),
          lastMessageSenderId: '',
          unreadCount: {userId1: 0, userId2: 0},
        );

        await _conversationsCollection.doc(conversationId).set(newConversation.toMap());

        return Right(newConversation);
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to get or create conversation: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ConversationModel>>> getUserConversations({
    required String userId,
  }) async {
    try {
      final snapshot = await _conversationsCollection
          .where('participantIds', arrayContains: userId)
          .orderBy('lastMessageTime', descending: true)
          .get();

      final conversations = snapshot.docs
          .map((doc) => ConversationModel.fromFirestore(doc))
          .toList();

      return Right(conversations);
    } catch (e) {
      return Left(Failure(message: 'Failed to get user conversations: ${e.toString()}'));
    }
  }

  @override
  Stream<Either<Failure, List<MessageModel>>> getConversationMessages({
    required String conversationId,
  }) {
    try {
      return _messagesCollection
          .doc(conversationId)
          .collection('messages')
          .orderBy('timestamp', descending: false)
          .snapshots()
          .map((snapshot) {
        final messages = snapshot.docs
            .map((doc) => MessageModel.fromFirestore(doc))
            .toList();
        return Right<Failure, List<MessageModel>>(messages);
      }).handleError((error) {
        return Left<Failure, List<MessageModel>>(
          Failure(message: 'Failed to get messages: ${error.toString()}'),
        );
      });
    } catch (e) {
      return Stream.value(
        Left(Failure(message: 'Failed to get messages: ${e.toString()}')),
      );
    }
  }

  @override
  Future<Either<Failure, void>> markMessagesAsRead({
    required String conversationId,
    required String userId,
  }) async {
    try {
      // Get unread messages for this user
      final messagesSnapshot = await _messagesCollection
          .doc(conversationId)
          .collection('messages')
          .where('receiverId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .get();

      // Batch update all unread messages
      final batch = firestore.batch();

      for (var doc in messagesSnapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }

      // Reset unread count in conversation
      batch.update(_conversationsCollection.doc(conversationId), {
        'unreadCount.$userId': 0,
      });

      await batch.commit();

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to mark messages as read: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteConversation({
    required String conversationId,
    required String userId,
  }) async {
    try {
      // Note: This is a soft delete - just removes the conversation from the user's view
      // For a complete delete, you would need to delete all messages as well

      // Get all messages in the conversation
      final messagesSnapshot = await _messagesCollection
          .doc(conversationId)
          .collection('messages')
          .get();

      // Delete all messages
      final batch = firestore.batch();
      for (var doc in messagesSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Delete conversation document
      batch.delete(_conversationsCollection.doc(conversationId));

      await batch.commit();

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to delete conversation: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadMessageCount({
    required String userId,
  }) async {
    try {
      final conversationsSnapshot = await _conversationsCollection
          .where('participantIds', arrayContains: userId)
          .get();

      int totalUnread = 0;

      for (var doc in conversationsSnapshot.docs) {
        final conversation = ConversationModel.fromFirestore(doc);
        totalUnread += conversation.getUnreadCountForUser(userId);
      }

      return Right(totalUnread);
    } catch (e) {
      return Left(Failure(message: 'Failed to get unread message count: ${e.toString()}'));
    }
  }
}
