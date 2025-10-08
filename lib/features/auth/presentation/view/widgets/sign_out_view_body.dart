import 'package:event_booking_app/features/auth/presentation/view/widgets/signout_handler.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/signout_header.dart';
import 'package:flutter/material.dart';

class SignOutViewBody extends StatelessWidget {
  const SignOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SignOutHeader(),
              const SizedBox(height: 30),
              SignOutHandler(),
            ],
          ),
        ),
      ),
    );
  }
}
