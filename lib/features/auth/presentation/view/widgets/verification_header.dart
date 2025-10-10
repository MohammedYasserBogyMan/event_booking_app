import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Verification", style: Styels.textStyleMedium24),
        const SizedBox(height: 12),
        Text(
          "We’ve send you the verification",
          style: Styels.textStyleRegular15.copyWith(color: Colors.black),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "code on ",
                style: Styels.textStyleRegular15.copyWith(color: Colors.black),
              ),
              TextSpan(
                text: email,
                style: Styels.textStyleRegular15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
