import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/services/shared_prefs_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> decideStartDestination() async {
    emit(SplashLoading());
    try {
      final firstOpen = SharedPrefsService.I.isFirstOpen();
      final rememberMe = SharedPrefsService.I.getRememberMe();
      final user = FirebaseAuth.instance.currentUser;

      log(
        '[SPLASH] firstOpen=$firstOpen, rememberMe=$rememberMe, user=${user?.uid}',
      );

      if (firstOpen) {
        emit(GoOnboarding());
        return;
      }

      if (rememberMe && user != null) {
        emit(GoHome());
      } else {
        if (!rememberMe && user != null) {
          await FirebaseAuth.instance.signOut();
        }
        emit(GoLogin());
      }
    } catch (e, st) {
      log('[SPLASH] error: $e\n$st');
      emit(GoLogin());
    }
  }
}
