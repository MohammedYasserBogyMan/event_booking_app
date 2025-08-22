part of 'publisher_cubit.dart';

@immutable
sealed class PublisherState {}

class PublisherInitial extends PublisherState {}

class PublisherLoading extends PublisherState {}

class PublisherSuccess extends PublisherState {
  final UserModel user;
  PublisherSuccess(this.user);
}

class PublisherFailure extends PublisherState {
  final String message;
  PublisherFailure(this.message);
}
