import 'package:event_booking_app/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = "LoginView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
