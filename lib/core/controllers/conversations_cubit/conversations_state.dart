part of 'conversations_cubit.dart';

abstract class ConversationsState {}

class ConversationsInitial extends ConversationsState {}

class ConversationsLoading extends ConversationsState {}

class ConversationsLoaded extends ConversationsState {
  final List<ConversationModel> conversations;
  final int unreadCount;

  ConversationsLoaded({
    required this.conversations,
    required this.unreadCount,
  });
}

class ConversationsFailure extends ConversationsState {
  final String message;

  ConversationsFailure({required this.message});
}
