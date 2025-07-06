import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/verification_auth_form_field.dart';
import 'package:flutter/material.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text("Verification", style: Styels.textStyle24),
            const SizedBox(height: 12),
            Text("We’ve send you the verification", style: Styels.textStyle15),
            Text("code on +1 2620 0323 7631", style: Styels.textStyle15),
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
