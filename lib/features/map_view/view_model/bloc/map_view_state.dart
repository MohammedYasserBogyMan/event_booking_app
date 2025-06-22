part of 'map_view_bloc.dart';

sealed class MapViewState extends Equatable {
  const MapViewState();

  @override
  List<Object> get props => [];
}

final class MapInitial extends MapViewState {}

class MapLoading extends MapViewState {}

class MapSuccess extends MapViewState {
  final List<MapModel> events;
  const MapSuccess(this.events);

  @override
  List<Object> get props => [events];
}

class MapFailure extends MapViewState {
  final String error;
  const MapFailure(this.error);

  @override
  List<Object> get props => [error];
}

class MapFiltered extends MapViewState {
  final List<MapModel> filteredEvents;
  final String category;
  const MapFiltered(this.filteredEvents, this.category);

  @override
  List<Object> get props => [filteredEvents, category];
}

class MapMarkerSelected extends MapViewState {
  final MapModel selectedEvent;
  const MapMarkerSelected(this.selectedEvent);

  @override
  List<Object> get props => [selectedEvent];
}
