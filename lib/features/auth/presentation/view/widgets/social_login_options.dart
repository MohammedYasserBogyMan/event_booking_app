import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class SocialLoginOptions extends StatelessWidget {
  const SocialLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "OR",
          style: Styels.textStyle16.copyWith(color: Color(0xff9D9898)),
        ),
        SizedBox(height: 5),

        SocialLoginButton(
          text: "Login with Google",
          image: AssetsData.loginGoogleIcon,
        ),
        SizedBox(height: 17),

        SocialLoginButton(
          text: "Login with Facebook",
          image: AssetsData.loginFacebookIcon,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
