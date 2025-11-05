import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/google_signin_cubit/google_signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit(this.authRepo) : super(InitialGoogleSignInState());

  final AuthRepo authRepo;

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    emit(LoadingGoogleSignInState());

    var result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) {
        emit(FailureGoogleSignInState(errMessage: failure.errMessage));
      },
      (_) {
        emit(SuccessGoogleSignInState());
      },
    );
  }
}
