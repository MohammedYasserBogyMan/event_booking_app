import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordAuthFormField extends StatefulWidget {
  const ResetPasswordAuthFormField({super.key});

  @override
  State<ResetPasswordAuthFormField> createState() =>
      _ResetPasswordAuthFormFieldState();
}

class _ResetPasswordAuthFormFieldState
    extends State<ResetPasswordAuthFormField> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(
            icon: Icons.mail_outlined,
            hintText: "abc@email.com",
            onSaved: (p0) {
              email = p0;
            },
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  try {
                    await resetPassword();
                    GoRouter.of(context).push(AppRouter.kLogin);
                    formKey.currentState!.reset();
                    showSnackBar(context, message: "success reset");
                  } catch (error) {
                    showSnackBar(context, message: error.toString());
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              text: "SEND",
            ),
          ),
        ],
      ),
    );
  }

  Future<void> resetPassword() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.sendPasswordResetEmail(email: email!);
  }
}
