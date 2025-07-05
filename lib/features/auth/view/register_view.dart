import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextFiled(icon: Icons.person_outline, hintText: "Full name"),
          SizedBox(height: 19),
          CustomTextFiled(icon: Icons.mail_outline, hintText: "abc@email.com"),
          SizedBox(height: 19),
          CustomTextFiled(icon: Icons.lock_outline, hintText: "Your password"),
          SizedBox(height: 19),
          CustomTextFiled(icon: Icons.lock_outline, hintText: "Confirm password"),
          SizedBox(height: 19),
          CustomTextFiled(icon: Icons.lock_outline, hintText: "Confirm password"),
          SizedBox(height: 19),
          CustomButton(text: "SIGN UP")
        ],
      ),
    );
  }
}
