import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class LoginRichText extends StatelessWidget {
  const LoginRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don’t have an account? ",
              style: Styels.textStyleRegular15.copyWith(color: Colors.black),
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  pushToNewScreen(
                    context,
                    locationOfNewScreen: AppRouter.kRegister,
                  );
                },
                child: Hero(
                  tag: "Sign up",
                  child: Text(
                    "Sign up",
                    style: Styels.textStyleRegular15.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
