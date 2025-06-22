import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_view_event.dart';
part 'map_view_state.dart';

class MapViewBloc extends Bloc<MapViewEvent, MapViewState> {
  MapViewBloc() : super(MapViewInitial()) {
    on<MapViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
