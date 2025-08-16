import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationAuthFormFields extends StatefulWidget {
  const RegistrationAuthFormFields({super.key});

  @override
  State<RegistrationAuthFormFields> createState() =>
      _RegistrationAuthFormFieldsState();
}

class _RegistrationAuthFormFieldsState
    extends State<RegistrationAuthFormFields> {
  String? email, name, password;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(
            icon: Icons.person_outline,
            hintText: "Full name",
            onSaved: (p0) {
              name = p0;
            },
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            onSaved: (p0) {
              email = p0;
            },
            icon: Icons.email_outlined,
            hintText: "abc@email.com",
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            icon: Icons.lock_outlined,
            hintText: "Your password",
            onSaved: (p0) {
              password = p0;
            },
            isPassword: true,
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            icon: Icons.lock_outlined,
            hintText: "Confirm password",
            onSaved: (p0) {
              password = p0;
            },
            isPassword: true,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: CustomButton(
              text: "SIGN UP",
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // trigger cubit here.
                  GoRouter.of(
                    context,
                  ).go(AppRouter.kVerification, extra: email);

                  formKey.currentState!.reset();
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
