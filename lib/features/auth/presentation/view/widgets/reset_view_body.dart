import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_password_auth_form_field.dart';
import 'package:flutter/material.dart';

class ResetViewBody extends StatelessWidget {
  const ResetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text("Resset Password", style: Styels.textStyle24),
            const SizedBox(height: 10),
            Text(
              "Please enter your email address to request a password reset",
              style: Styels.textStyle15,
            ),
            const SizedBox(height: 25),
            ResetPasswordAuthFormField(),
          ],
        ),
      ),
    );
  }
}
