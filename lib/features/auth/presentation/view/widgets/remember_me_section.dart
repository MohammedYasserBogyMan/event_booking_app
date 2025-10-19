import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/switch_icon.dart';
import 'package:flutter/material.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SwitchIcon(),
            const SizedBox(width: 5),
            Text(
              "Remember Me",
              style: Styels.textStyleRegular14.copyWith(color: Colors.black),
            ),
          ],
        ),
        Flexible(child: const SizedBox(width: 66)),
        GestureDetector(
          onTap: () {
            pushToNewScreen(
              context,
              locationOfNewScreen: AppRouter.kforgetpassword,
            );
          },
          child: Hero(
            tag: "Forgot Password",
            child: Text(
              "Forgot Password?",
              style: Styels.textStyleRegular14.copyWith(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
