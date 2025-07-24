import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordAuthFormField extends StatelessWidget {
  ResetPasswordAuthFormField({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(icon: Icons.mail_outlined, hintText: "abc@email.com"),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kVerification);
              },
              text: "SEND",
            ),
          ),
        ],
      ),
    );
  }
}
