import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final EventsRepo eventsRepo;

  HomeCubit(this.eventsRepo) : super(HomeInitial());

  Future<void> getAllEvents() async {
    emit(HomeLoading());

    final result = await eventsRepo.fetchAllEvents();

    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (events) => emit(HomeSuccess(events)),
    );
  }
}
