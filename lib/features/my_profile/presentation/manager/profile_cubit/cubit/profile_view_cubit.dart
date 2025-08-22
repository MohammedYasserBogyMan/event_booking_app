import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<ProfileViewState> {
  final UserRepo userRepo;
  final AuthRepo authRepo;

  ProfileViewCubit(this.userRepo, this.authRepo) : super(ProfileViewInitial());

  Future<void> fetchMyProfile() async {
    emit(ProfileViewLoading());

    final idRes = await authRepo.getCurrentUserId();

    await idRes.fold(
      (failure) async {
        emit(ProfileViewFailure(failure.errMessage));
      },
      (uid) async {
        final userRes = await userRepo.getUserByUid(uid);
        userRes.fold(
          (failure) => emit(ProfileViewFailure(failure.errMessage)),
          (user) => emit(ProfileViewSuccess(user)),
        );
      },
    );
  }
}
