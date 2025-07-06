import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';

class VerificarionAuthFormFields extends StatelessWidget {
  VerificarionAuthFormFields({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: CustomButton(text: "Continue"),
          ),
        ],
      ),
    );
  }
}
