import 'package:go_router/go_router.dart';

import 'package:event_booking_app/features/auth/presentation/view/login_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/register_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/resset_password_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/verification_view.dart';
import 'package:event_booking_app/features/empty_notification/presentation/view/empty_notification_view.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:event_booking_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const splash = '/';
  static const kHomeView = '/home';
  static const kOnboarding = '/onboarding';
  static const kLogin = '/login';
  static const kRegister = '/register';
  static const kforgetpassword = '/forgetpassword';
  static const kEmptyNotification = '/empty_notification';
  static const kVerification = '/verification';
  static final router = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashView()),
      GoRoute(path: kOnboarding, builder: (context, state) => OnboardingView()),
      GoRoute(path: kLogin, builder: (context, state) => LoginView()),
      GoRoute(path: kRegister, builder: (context, state) => RegisterView()),
      GoRoute(
        path: kforgetpassword,
        builder: (context, state) => RessetPasswordView(),
      ),
      GoRoute(
        path: kVerification,
        builder: (context, state) => VerificationView(),
      ),
      GoRoute(
        path: kEmptyNotification,
        builder: (context, state) => EmptyNotificationView(),
      ),
    ],
  );
}
