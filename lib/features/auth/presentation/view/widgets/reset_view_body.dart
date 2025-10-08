import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_password_auth_form_field.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_password_header.dart';
import 'package:flutter/material.dart';

class ResetViewBody extends StatelessWidget {
  const ResetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ResetPasswordHeader(),
            const SizedBox(height: 25),
            ResetPasswordAuthFormField(),
          ],
        ),
      ),
    );
  }
}
