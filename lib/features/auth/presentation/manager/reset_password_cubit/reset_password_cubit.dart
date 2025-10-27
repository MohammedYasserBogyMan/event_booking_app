import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart'
    show AuthRepo;
import 'package:event_booking_app/features/auth/presentation/manager/reset_password_cubit/reset_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  final UserRepo userRepo;
  final AuthRepo authRepo;
  ResetPasswordCubit(this.userRepo, this.authRepo)
    : super(InitialResetPasswordState());

  Future<void> resetPassword({required String email}) async {
    emit(LoadingResetState());
    final reset = await authRepo.resetPassword(email: email);
    reset.fold(
      (failure) {
        emit(FailureResetState(errMessage: failure.errMessage));
      },
      (reset) {
        emit(SuccessResetState());
      },
    );
  }
}
