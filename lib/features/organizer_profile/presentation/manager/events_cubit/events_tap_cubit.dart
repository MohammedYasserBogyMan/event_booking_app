import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo.dart';
part 'events_tap_states.dart';

class EventsTabCubit extends Cubit<EventsTabState> {
  EventsTabCubit(this.eventsRepo) : super(InitialEventsTabState());
  final EventsRepo eventsRepo;

  Future<void> getEvents() async {
    emit(LoadingEventsTapState());
    var result = await eventsRepo.fetchAllEvents();
    result.fold(
      (failure) => emit(FailureEventsTabState(errMessage: failure.message)),
      (events) => emit(SuccessEventsTabState(events: events)),
    );
  }
}
