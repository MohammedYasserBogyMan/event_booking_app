import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/services/shared_prefs_service.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final UserRepo userRepo;
  final AuthRepo authRepo;
  LoginCubit(this.authRepo, this.userRepo) : super(InitialLoginState());

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoadingLoginState());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(FailureLoginState(errMessage: failure.errMessage)),
      (success) async {
        final rememberMe = SharedPrefsService.I.getRememberMe();
        if (rememberMe) {
          await SharedPrefsService.I.setRememberMe(true);
        }
        final idRes = await authRepo.getCurrentUserId();
        idRes.fold(
          (failure) => emit(FailureLoginState(errMessage: failure.errMessage)),
          (uid) {
            context.read<CurrentUserCubit>().fetchCurrentUserInfo();
            emit(SuccessLoginState());
          },
        );
      },
    );
  }
}
