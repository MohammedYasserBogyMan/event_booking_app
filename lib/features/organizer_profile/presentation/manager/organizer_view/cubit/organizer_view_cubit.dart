import 'package:bloc/bloc.dart';
import 'package:event_booking_app/features/organizer_profile/data/model/user_model.dart';
import 'package:event_booking_app/features/organizer_profile/data/repo/organizer_repo.dart';
import 'package:meta/meta.dart';

part 'organizer_view_state.dart';

class OrganizerProfileCubit extends Cubit<OrganizerProfileState> {
  final OrganizerRepo repo;

  OrganizerProfileCubit(this.repo) : super(OrganizerViewInitial());

  Future<void> fetchProfile(String organizerId) async {
    emit(OrganizerProfileLoading());

    final result = await repo.fetchOrganizerProfileData(organizerId);

    result.fold(
      (failure) => emit(OrganizerProfileFailure(failure.errMessage)),
      (user) => emit(OrganizerProfileSuccess(user)),
    );
  }
}
