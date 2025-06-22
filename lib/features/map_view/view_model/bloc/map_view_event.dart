part of 'map_view_bloc.dart';

sealed class MapViewEvent extends Equatable {
  const MapViewEvent();

  @override
  List<Object> get props => [];
}

class LoadMapEvents extends MapViewEvent {}

class FilterMapEvents extends MapViewEvent {
  final String category;
  const FilterMapEvents(this.category);

  @override
  List<Object> get props => [category];
}

class SelectMarkerEvent extends MapViewEvent {
  final MapModel selectedEvent;
  const SelectMarkerEvent(this.selectedEvent);

  @override
  List<Object> get props => [selectedEvent];
}

class ClearFilters extends MapViewEvent {}