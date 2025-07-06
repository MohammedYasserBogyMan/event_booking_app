import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/core/widgets/social_login_options.dart';
import 'package:event_booking_app/features/auth/presentation/view/register_view.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 73),
              Column(
                children: [
                  Center(child: Image.asset(AssetsData.logoMark)),
                  SizedBox(height: 8),
                  Text("EventHub", style: Styels.textStyle35),
                ],
              ),
              const SizedBox(height: 30),
              const Text('Sign in', style: Styels.textStyle24),
              const SizedBox(height: 21),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SwitchIcon(),
                      Text("Remember Me", style: Styels.textStyle14),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text("Forgot Password?", style: Styels.textStyle14),
                  ),
                ],
              ),
              const SizedBox(height: 36),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: CustomButton(text: 'SIGN IN'),
              ),
              SizedBox(height: 24),
              SocialLoginOptions(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account? ", style: Styels.textStyle15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                    child: Text(
                      "Sign up",
                      style: Styels.textStyle15.copyWith(
                        color: Color(0xff5669FF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
