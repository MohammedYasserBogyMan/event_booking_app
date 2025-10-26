import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/features/auth/logic/auth_functions.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/remember_me_section.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_in_form_field_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SignInAuthFormFields extends StatefulWidget {
  const SignInAuthFormFields({super.key});

  @override
  State<SignInAuthFormFields> createState() => _SignInAuthFormFieldsState();
}

class _SignInAuthFormFieldsState extends State<SignInAuthFormFields> {
  String? email, password;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SignInFormFieldsBlocConsumer(
      child: Form(
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
            RememberMeSection(),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: CustomButton(
                text: 'SIGN IN',
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    await loginInOurApplication(
                      context,
                      email: email!,
                      password: password!,
                    );
                    formkey.currentState!.reset();
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
      ),
    );
  }
}
