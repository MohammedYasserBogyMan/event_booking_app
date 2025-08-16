import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/switch_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInAuthFormFields extends StatefulWidget {
  const SignInAuthFormFields({super.key});

  @override
  State<SignInAuthFormFields> createState() => _SignInAuthFormFieldsState();
}

class _SignInAuthFormFieldsState extends State<SignInAuthFormFields> {
  String? email, password;
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
            onSaved: (p0) {
              email = p0;
            },
            hintText: 'abc@email.com',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            onSaved: (p0) {
              password = p0;
            },
            hintText: 'Your password',
            icon: Icons.lock_outline,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SwitchIcon(),
                  const SizedBox(width: 5),
                  Text("Remember Me", style: Styels.textStyle14),
                ],
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go(AppRouter.kforgetpassword);
                },
                child: Text("Forgot Password?", style: Styels.textStyle14),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomButton(
              text: 'SIGN IN',
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();

                  // trigger cubit here.

                  formkey.currentState!.reset();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
