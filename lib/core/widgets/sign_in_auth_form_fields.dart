import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class SignInAuthFormFields extends StatelessWidget {
  SignInAuthFormFields({super.key});
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(
            hintText: 'abc@email.com',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            hintText: 'Your password',
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
