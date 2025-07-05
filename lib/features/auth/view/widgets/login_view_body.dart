import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(child: Image.asset(AssetsData.logo)),
              const SizedBox(height: 40),
              const Text('Sign in', style: Styels.textStyle24),
              const SizedBox(height: 20),
              CustomTextFiled(
                hintText: 'abc@email.com',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              CustomTextFiled(
                hintText: 'Your password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              CustomButton(text: 'SIGN IN'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
