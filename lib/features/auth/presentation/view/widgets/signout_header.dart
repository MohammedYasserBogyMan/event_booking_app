import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class SignOutHeader extends StatelessWidget {
  const SignOutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.logout, size: 100, color: AppColor.primary),
        const SizedBox(height: 20),
        Text(
          "Are you sure you want to sign out?",
          style: Styels.textStyleRegular22.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
