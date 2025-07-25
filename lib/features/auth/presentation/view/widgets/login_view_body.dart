import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_in_auth_form_fields.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/social_login_options.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 73),
            Column(
              children: [
                Center(child: Image.asset(AssetsData.logoMark)),
                const SizedBox(height: 8),
                Text("EventHub", style: Styels.textStyle35),
              ],
            ),
            const SizedBox(height: 30),
            const Text('Sign in', style: Styels.textStyle24),
            const SizedBox(height: 21),
            SignInAuthFormFields(),
            SocialLoginOptions(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account? ", style: Styels.textStyle15),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kRegister);
                  },
                  child: Text(
                    "Sign up",
                    style: Styels.textStyle15.copyWith(color: AppColor.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
