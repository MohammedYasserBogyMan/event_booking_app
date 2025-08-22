part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<EventModel> events;
  HomeSuccess(this.events);
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
