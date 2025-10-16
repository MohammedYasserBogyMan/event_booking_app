part of 'my_events_cubit.dart';

@immutable
sealed class MyEventsState {}

final class MyEventsInitial extends MyEventsState {}

final class MyEventsLoading extends MyEventsState {}

final class MyEventsSuccess extends MyEventsState {
  final List<EventModel> events;
  MyEventsSuccess(this.events);
}

final class MyEventsFailure extends MyEventsState {
  final String message;
  MyEventsFailure(this.message);
}

final class MyEventsUpdating extends MyEventsState {}

final class MyEventsUpdateSuccess extends MyEventsState {
  final String message;
  MyEventsUpdateSuccess(this.message);
}

final class MyEventsUpdateFailure extends MyEventsState {
  final String message;
  MyEventsUpdateFailure(this.message);
}
