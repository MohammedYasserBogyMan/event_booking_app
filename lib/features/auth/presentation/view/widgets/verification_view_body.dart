import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/resend_code_timer.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/verification_auth_form_field.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/verification_header.dart';
import 'package:flutter/material.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            VerificationHeader(email: userModel.email),
            const SizedBox(height: 27),
            VerificarionAuthFormFields(userModel: userModel),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: ResendCodeTimer(),
            ),
          ],
        ),
      ),
    );
  }
}

