import 'package:event_booking_app/features/auth/presentation/view/widgets/register_auth_form_fields.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/register_rich_text.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/register_view_header.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/social_login_options.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            RegisterViewHeader(),
            const SizedBox(height: 20),
            RegistrationAuthFormFields(),
            const SizedBox(height: 36),
            SocialLoginOptions(),
            const SizedBox(height: 20),
            RegisterRichText(),
          ],
        ),
      ),
    );
  }
}
