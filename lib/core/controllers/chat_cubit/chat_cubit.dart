import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/conversation_model.dart';
import '../../models/message_model.dart';
import '../../repositories/messaging_repo/messaging_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final MessagingRepo messagingRepo;
  StreamSubscription? _messagesSubscription;

  ChatCubit({required this.messagingRepo}) : super(ChatInitial());

  /// Load or create a conversation and listen to messages
  Future<void> loadConversation({
    required String currentUserId,
    required String otherUserId,
  }) async {
    emit(ChatLoading());

    // Get or create conversation
    final conversationResult = await messagingRepo.getOrCreateConversation(
      userId1: currentUserId,
      userId2: otherUserId,
    );

    conversationResult.fold(
      (failure) => emit(ChatFailure(message: failure.message)),
      (conversation) {
        // Mark messages as read when opening the chat
        messagingRepo.markMessagesAsRead(
          conversationId: conversation.id,
          userId: currentUserId,
        );

        // Subscribe to messages stream
        _messagesSubscription?.cancel();
        _messagesSubscription = messagingRepo
            .getConversationMessages(conversationId: conversation.id)
            .listen((result) {
          result.fold(
            (failure) => emit(ChatFailure(message: failure.message)),
            (messages) => emit(ChatMessagesLoaded(
              messages: messages,
              conversation: conversation,
            )),
          );
        });
      },
    );
  }

  /// Send a message
  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
    MessageType type = MessageType.text,
  }) async {
    if (content.trim().isEmpty) return;

    final result = await messagingRepo.sendMessage(
      senderId: senderId,
      receiverId: receiverId,
      content: content,
      type: type,
    );

    result.fold(
      (failure) => emit(ChatFailure(message: failure.message)),
      (message) {
        // Message sent successfully - the stream will automatically update the UI
      },
    );
  }

  /// Mark messages as read
  Future<void> markAsRead({
    required String conversationId,
    required String userId,
  }) async {
    await messagingRepo.markMessagesAsRead(
      conversationId: conversationId,
      userId: userId,
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
