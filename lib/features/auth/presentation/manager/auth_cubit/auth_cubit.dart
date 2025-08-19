import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoadingLoginState());
    final login = await authRepo.login(email: email, password: password);
    login.fold(
      (failure) {
        return emit(FailureLoginState(errMessage: failure.errMessage));
      },
      (login) {
        return emit(SuccessLoginState());
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(LoadingRegisterState());
    final register = await authRepo.register(email: email, password: password);
    register.fold(
      (failure) {
        emit(FailureRegisterState(errMessage: failure.errMessage));
      },
      (register) {
        emit(SuccessRegisterState());
      },
    );
  }

  Future<void> reset({required String email}) async {
    emit(LoadingResetState());
    final reset = await authRepo.resetPassword(email: email);
    reset.fold(
      (failure) {
        emit(FailureRegisterState(errMessage: failure.errMessage));
      },
      (reset) {
        emit(SuccessRegisterState());
      },
    );
  }
}
