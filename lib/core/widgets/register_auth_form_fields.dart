import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class RegistrationAuthFormFields extends StatelessWidget {
  RegistrationAuthFormFields({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(icon: Icons.person_outline, hintText: "Full name"),
          const SizedBox(height: 19),
          CustomTextFiled(
            icon: Icons.email_outlined,
            hintText: "abc@email.com",
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            icon: Icons.lock_outlined,
            hintText: "Your password",
            isPassword: true,
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            icon: Icons.lock_outlined,
            hintText: "Confirm password",
            isPassword: true,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: CustomButton(text: "SIGN UP"),
          ),
        ],
      ),
    );
  }
}
