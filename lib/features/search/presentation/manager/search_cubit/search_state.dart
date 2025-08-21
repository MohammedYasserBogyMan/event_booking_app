import 'package:event_booking_app/features/search/data/models/event_ui_model.dart';

abstract class SearchStates {}

class InitialSearchState extends SearchStates {}

class SuccessSearchState extends SearchStates {
  final List<EventUiModel> events;
  SuccessSearchState({required this.events});
}

class LoadingSearchState extends SearchStates {}

class FailureSearchState extends SearchStates {
  final String errMessage;
  FailureSearchState({required this.errMessage});
}
