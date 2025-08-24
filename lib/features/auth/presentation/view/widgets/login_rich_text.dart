import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginRichText extends StatelessWidget {
  const LoginRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account? ", style: Styels.textStyle15),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kRegister);
          },
          child: Hero(
            tag: "Sign up",
            child: Text(
              "Sign up",
              style: Styels.textStyle15.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
