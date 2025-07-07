import 'package:event_booking_app/features/auth/presentation/view/login_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/register_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/resset_password_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/verification_view.dart';
import 'package:event_booking_app/features/empty_notification/presentation/view/empty_notification_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterView.id: (context) => RegisterView(),
        LoginView.id: (context) => LoginView(),
        VerificationView.id: (context) => VerificationView(),
        EmptyNotificationView.id: (context) => EmptyNotificationView(),
      },
      debugShowCheckedModeBanner: false,
      home: EmptyNotificationView(),
    );
  }
}
