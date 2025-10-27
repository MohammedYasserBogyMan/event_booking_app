import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/signout_cubit/signout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignoutCubit extends Cubit<SignoutStates> {
  final UserRepo userRepo;
  final AuthRepo authRepo;
  SignoutCubit(this.userRepo, this.authRepo) : super(InitialSignoutStates());

  Future<void> signOut() async {
    emit(LoadingSignOutState());
    final signOut = await authRepo.signOut();
    signOut.fold(
      (failure) {
        emit(FailureSignOutState(errMessage: failure.errMessage));
      },
      (reset) {
        emit(SuccessSignOutState());
      },
    );
  }
}
