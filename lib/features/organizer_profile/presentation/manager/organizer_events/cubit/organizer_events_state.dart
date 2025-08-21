part of 'organizer_events_cubit.dart';

@immutable
sealed class OrganizerEventsState {}

final class OrganizerEventsInitial extends OrganizerEventsState {}

final class OrganizerEventsLoading extends OrganizerEventsState {}

final class OrganizerEventsSuccess extends OrganizerEventsState {
  final List<EventModel> events;
  OrganizerEventsSuccess(this.events);
}

final class OrganizerEventsFailure extends OrganizerEventsState {
  final String message;
  OrganizerEventsFailure(this.message);
}
