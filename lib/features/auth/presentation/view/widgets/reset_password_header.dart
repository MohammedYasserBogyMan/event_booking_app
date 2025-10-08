import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: "Forgot Password",
          child: Text("Resset Password", style: Styels.textStyleMedium24),
        ),
        const SizedBox(height: 10),
        Text(
          "Please enter your email address to request a password reset",
          style: Styels.textStyleRegular15,
        ),
      ],
    );
  }
}
