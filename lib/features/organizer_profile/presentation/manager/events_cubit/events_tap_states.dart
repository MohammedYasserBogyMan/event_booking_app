part of 'events_tap_cubit.dart';

abstract class EventsTabState {}

class InitialEventsTabState extends EventsTabState {}

class SuccessEventsTabState extends EventsTabState {
  List<EventModel> events;
  SuccessEventsTabState({required this.events});
}

class FailureEventsTabState extends EventsTabState {
  final String errMessage;
  FailureEventsTabState({required this.errMessage});
}

class LoadingEventsTapState extends EventsTabState {}
