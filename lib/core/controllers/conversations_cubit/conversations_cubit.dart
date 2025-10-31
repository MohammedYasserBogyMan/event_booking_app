import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/conversation_model.dart';
import '../../repositories/messaging_repo/messaging_repo.dart';

part 'conversations_state.dart';

class ConversationsCubit extends Cubit<ConversationsState> {
  final MessagingRepo messagingRepo;

  ConversationsCubit({required this.messagingRepo}) : super(ConversationsInitial());

  /// Load all conversations for a user
  Future<void> loadConversations({required String userId}) async {
    emit(ConversationsLoading());

    final conversationsResult = await messagingRepo.getUserConversations(
      userId: userId,
    );

    final unreadCountResult = await messagingRepo.getUnreadMessageCount(
      userId: userId,
    );

    conversationsResult.fold(
      (failure) => emit(ConversationsFailure(message: failure.message)),
      (conversations) {
        final unreadCount = unreadCountResult.fold(
          (failure) => 0,
          (count) => count,
        );

        emit(ConversationsLoaded(
          conversations: conversations,
          unreadCount: unreadCount,
        ));
      },
    );
  }

  /// Delete a conversation
  Future<void> deleteConversation({
    required String conversationId,
    required String userId,
  }) async {
    final result = await messagingRepo.deleteConversation(
      conversationId: conversationId,
      userId: userId,
    );

    result.fold(
      (failure) => emit(ConversationsFailure(message: failure.message)),
      (_) {
        // Reload conversations after deletion
        loadConversations(userId: userId);
      },
    );
  }

  /// Get unread message count
  Future<int> getUnreadCount({required String userId}) async {
    final result = await messagingRepo.getUnreadMessageCount(userId: userId);
    return result.fold((failure) => 0, (count) => count);
  }
}
