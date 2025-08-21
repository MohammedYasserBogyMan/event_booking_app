part of 'create_event_cubit.dart';

@immutable
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}

class CreateEventLoading extends CreateEventState {}

class CreateEventSuccess extends CreateEventState {}

class CreateEventFailure extends CreateEventState {
  final String error;
  CreateEventFailure(this.error);
}
