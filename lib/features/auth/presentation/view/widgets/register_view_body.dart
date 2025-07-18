import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/register_auth_form_fields.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/social_login_options.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text("Sign up", style: Styels.textStyle24),
            const SizedBox(height: 20),
            RegistrationAuthFormFields(),
            SizedBox(height: 36),
            SocialLoginOptions(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: Styels.textStyle15),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sign in",
                    style: Styels.textStyle15.copyWith(
                      color:AppColor.primary,
                    ),
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
