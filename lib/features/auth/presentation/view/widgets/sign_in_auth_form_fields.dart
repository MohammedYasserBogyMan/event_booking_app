import 'dart:developer';

import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/constants/cons.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/switch_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController controller = TextEditingController();
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
              controller.clear();
            },
            hintText: 'abc@email.com',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 19),
          CustomTextFiled(
            onSaved: (p0) {
              password = p0;
              controller.clear();
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
                  try {
                    await signIn();
                    showSnackBar(context, message: "Success Login");
                    GoRouter.of(context).go(AppRouter.kHomeView);
                    formkey.currentState!.reset();
                    controller.clear();
                  } on FirebaseAuthException catch (firebaseException) {
                    if (firebaseException.code == "invalid-credential") {
                      showSnackBar(
                        context,
                        message:
                            "Invalid credentials, please try again or SignUp",
                      );
                    }
                  } catch (error) {
                    showSnackBar(context, message: error.toString());
                  }
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

  Future<void> signIn() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    userCredential.user;
  }
}

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 4),
      backgroundColor: AppColor.primary,
      content: Center(
        child: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: kFont,
          ),
        ),
      ),
    ),
  );
}
