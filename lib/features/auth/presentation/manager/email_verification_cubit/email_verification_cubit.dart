import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/email_verification_cubit/email_verification_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(this.authRepo)
      : super(InitialEmailVerificationState());

  final AuthRepo authRepo;

  // Check if email is verified
  Future<void> checkEmailVerification() async {
    emit(LoadingEmailVerificationState());

    var result = await authRepo.checkEmailVerified();

    result.fold(
      (failure) {
        emit(FailureEmailVerificationState(errMessage: failure.errMessage));
      },
      (isVerified) {
        if (isVerified) {
          emit(SuccessEmailVerificationState());
        } else {
          emit(EmailNotVerifiedState());
        }
      },
    );
  }

  // Resend verification email
  Future<void> resendVerificationEmail() async {
    var result = await authRepo.sendEmailVerification();

    result.fold(
      (failure) {
        emit(ResendEmailFailureState(errMessage: failure.errMessage));
      },
      (_) {
        emit(ResendEmailSuccessState());
      },
    );
  }

  // Reload user data
  Future<void> reloadUser() async {
    await authRepo.reloadUser();
  }
}
