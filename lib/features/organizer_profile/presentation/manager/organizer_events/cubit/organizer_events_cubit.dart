import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/organizer_profile/data/repo/organizer_repo.dart';
import 'package:meta/meta.dart';

part 'organizer_events_state.dart';

class OrganizerEventsCubit extends Cubit<OrganizerEventsState> {
  final OrganizerRepo organizerRepo;

  OrganizerEventsCubit(this.organizerRepo) : super(OrganizerEventsInitial());

  Future<void> fetchOrganizerEvents(String organizerId) async {
    emit(OrganizerEventsLoading());
    final result = await organizerRepo.fetchOrganizerEvents(organizerId);

    result.fold(
      (failure) => emit(OrganizerEventsFailure(failure.errMessage)),
      (events) => emit(OrganizerEventsSuccess(events)),
    );
  }
}
