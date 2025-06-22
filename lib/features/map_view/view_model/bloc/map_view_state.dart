part of 'map_view_bloc.dart';

sealed class MapViewState extends Equatable {
  const MapViewState();
}

final class MapViewInitial extends MapViewState {
  @override
  List<Object> get props => [];
}
