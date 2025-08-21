import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/verification_auth_form_field.dart';
import 'package:flutter/material.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text("Verification", style: Styels.textStyle24),
            const SizedBox(height: 12),
            Text("We’ve send you the verification", style: Styels.textStyle15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "code on ",
                    style: Styels.textStyle15.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: "$email",
                    style: Styels.textStyle15.copyWith(color: AppColor.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 27),
            VerificarionAuthFormFields(),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Re-send code in  ", style: Styels.textStyle15),
                  Text(
                    "0:20",
                    style: Styels.textStyle15.copyWith(color: AppColor.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
