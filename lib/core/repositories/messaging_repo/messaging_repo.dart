import 'package:dartz/dartz.dart';
import '../../failure/errors.dart';
import '../../models/conversation_model.dart';
import '../../models/message_model.dart';

/// Abstract repository for managing messaging functionality
abstract class MessagingRepo {
  /// Send a message to a user
  Future<Either<Failure, MessageModel>> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
    MessageType type = MessageType.text,
  });

  /// Get or create a conversation between two users
  Future<Either<Failure, ConversationModel>> getOrCreateConversation({
    required String userId1,
    required String userId2,
  });

  /// Get all conversations for a user
  Future<Either<Failure, List<ConversationModel>>> getUserConversations({
    required String userId,
  });

  /// Get messages for a conversation (with real-time stream)
  Stream<Either<Failure, List<MessageModel>>> getConversationMessages({
    required String conversationId,
  });

  /// Mark messages as read
  Future<Either<Failure, void>> markMessagesAsRead({
    required String conversationId,
    required String userId,
  });

  /// Delete a conversation
  Future<Either<Failure, void>> deleteConversation({
    required String conversationId,
    required String userId,
  });

  /// Get unread message count for a user
  Future<Either<Failure, int>> getUnreadMessageCount({
    required String userId,
  });
}
