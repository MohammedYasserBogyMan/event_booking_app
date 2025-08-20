import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/repositories/event_repo.dart';
import 'package:event_booking_app/features/see_all_events/presentation/manager/see_all_events_cubit/see_all_events_states.dart';

class SeeAllEventsCubit extends Cubit<SeeAllEventsStates> {
  SeeAllEventsCubit(this.eventsRepo) : super(InitialSeeAllEventsState());
  final EventsRepo eventsRepo;
  fetchEvents() async {
    emit(LoadingSeeAllEventsState());
    var events = await eventsRepo.fetchAllEvents();
    events.fold(
      (failure) {
        emit(FailureSeeAllEventsState(errMessage: failure.message));
      },
      (success) {
        emit(SuccessSeeAllEventsState(events: success));
      },
    );
  }
}
