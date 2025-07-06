import 'package:event_booking_app/features/auth/presentation/view/login_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/register_view.dart';
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
      },
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
