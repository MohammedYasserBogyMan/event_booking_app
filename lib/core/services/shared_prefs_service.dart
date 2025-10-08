import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const firstOpen = 'first_open';
  static const rememberMe = 'remember_me';
}

class SharedPrefsService {
  SharedPrefsService._();
  static final SharedPrefsService I = SharedPrefsService._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isFirstOpen() {
    return _prefs?.getBool(PrefKeys.firstOpen) ?? true;
  }

  Future<void> setFirstOpenFalse() async {
    await _prefs?.setBool(PrefKeys.firstOpen, false);
  }

  bool getRememberMe() {
    return _prefs?.getBool(PrefKeys.rememberMe) ?? false;
  }

  Future<void> setRememberMe(bool value) async {
    await _prefs?.setBool(PrefKeys.rememberMe, value);
  }

  Future<void> clearAll() async {
    await _prefs?.clear();
  }

  Future<void> handleOnboardingCompletion(BuildContext context) async {
    await setFirstOpenFalse();
    final remember = getRememberMe();
    final user = FirebaseAuth.instance.currentUser;

    if (remember && user != null) {
      goToNewScreen(context, locationOfNewScreen: AppRouter.kHomeView);
    } else {
      if (user != null && !remember) {
        await FirebaseAuth.instance.signOut();
      }
      goToNewScreen(context, locationOfNewScreen: AppRouter.kLogin);
    }
  }
}
