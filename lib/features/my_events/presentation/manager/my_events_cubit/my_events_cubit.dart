import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
import 'package:meta/meta.dart';

part 'my_events_state.dart';

class MyEventsCubit extends Cubit<MyEventsState> {
  final EventsRepo eventsRepo;

  MyEventsCubit(this.eventsRepo) : super(MyEventsInitial());

  Future<void> getMyEvents(String userId) async {
    emit(MyEventsLoading());

    final result = await eventsRepo.fetchMyEvents(userId: userId);

    result.fold(
      (failure) => emit(MyEventsFailure(failure.message)),
      (events) => emit(MyEventsSuccess(events)),
    );
  }

  Future<void> updateEvent(EventModel event, String userId) async {
    emit(MyEventsUpdating());

    final result = await eventsRepo.updateEvent(event: event);

    result.fold(
      (failure) => emit(MyEventsUpdateFailure(failure.message)),
      (message) {
        emit(MyEventsUpdateSuccess(message));
        // Refresh the events list after update
        getMyEvents(userId);
      },
    );
  }
}
