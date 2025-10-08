import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class RegisterRichText extends StatelessWidget {
  const RegisterRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ", style: Styels.textStyleRegular15),
        GestureDetector(
          onTap: () {
            goToBackScreen(context);
          },
          child: Text(
            "Sign in",
            style: Styels.textStyleRegular15.copyWith(color: AppColor.primary),
          ),
        ),
      ],
    );
  }
}
