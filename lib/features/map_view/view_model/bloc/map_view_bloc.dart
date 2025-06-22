import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:event_booking_app/features/map_view/model/map_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'map_view_event.dart';
part 'map_view_state.dart';

class MapViewBloc extends Bloc<MapViewEvent, MapViewState> {
  MapViewBloc() : super(MapInitial()) {
    on<LoadMapEvents>(loadMapEvents);
    on<FilterMapEvents>(filterMapEvents);
    on<SelectMarkerEvent>(selectMarkerEvent);
    on<ClearFilters>(clearFilters);
  }

  FutureOr<void> selectMarkerEvent(event, emit) {}

  FutureOr<void> filterMapEvents(event, emit) {}

  FutureOr<void> loadMapEvents(event, emit) {}

  FutureOr<void> clearFilters(event, emit) {}
}
