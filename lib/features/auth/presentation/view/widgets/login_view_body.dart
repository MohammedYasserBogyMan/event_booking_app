import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/login_rich_text.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/login_view_header.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_in_auth_form_fields.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/social_login_options.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginViewHeader(),
              const SizedBox(height: 30),
              const Text('Sign in', style: Styels.textStyleMedium24),
              const SizedBox(height: 21),
              SignInAuthFormFields(),
              const SizedBox(height: 24),
              SocialLoginOptions(),
              const SizedBox(height: 20),
              LoginRichText(),
              const SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }
}
