part of 'chat_cubit.dart';

abstract class ChatState {}

// Note: MessageModel and ConversationModel are imported in chat_cubit.dart

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatMessagesLoaded extends ChatState {
  final List<MessageModel> messages;
  final ConversationModel conversation;

  ChatMessagesLoaded({
    required this.messages,
    required this.conversation,
  });
}

class ChatMessageSending extends ChatState {}

class ChatMessageSent extends ChatState {
  final MessageModel message;

  ChatMessageSent({required this.message});
}

class ChatFailure extends ChatState {
  final String message;

  ChatFailure({required this.message});
}
