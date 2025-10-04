import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  final UserRepo userRepo;
  final AuthRepo authRepo;

  CurrentUserCubit(this.userRepo, this.authRepo) : super(CurrentUserInitial());

  Future<void> fetchCurrentUserInfo() async {
    emit(CurrentUserLoading());
    final idRes = await authRepo.getCurrentUserId();
    await idRes.fold(
      (failure) async {
        emit(CurrentUserFailure(failure.errMessage));
      },
      (uid) async {
        final userRes = await userRepo.getUserByUid(uid);
        userRes.fold(
          (failure) => emit(CurrentUserFailure(failure.errMessage)),
          (user) => emit(CurrentUserSuccess(user)),
        );
      },
    );
  }

  Future<void> reset() async {
    emit(CurrentUserInitial());
  }
}
