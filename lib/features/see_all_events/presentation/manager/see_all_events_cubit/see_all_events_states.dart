import 'package:event_booking_app/core/models/event_model.dart';

abstract class SeeAllEventsStates {}

class InitialSeeAllEventsState extends SeeAllEventsStates {}

class SuccessSeeAllEventsState extends SeeAllEventsStates {
  final List<EventModel> events;
  SuccessSeeAllEventsState({required this.events});
}

class LoadingSeeAllEventsState extends SeeAllEventsStates {}

class FailureSeeAllEventsState extends SeeAllEventsStates {
  final String errMessage;
  FailureSeeAllEventsState({required this.errMessage});
}
