import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/core/widgets/social_login_options.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text("Sign up", style: Styels.textStyle24),
              const SizedBox(height: 20),
              CustomTextFiled(
                icon: Icons.person_outline,
                hintText: "Full name",
              ),
              const SizedBox(height: 19),
              CustomTextFiled(
                icon: Icons.email_outlined,
                hintText: "abc@email.com",
              ),
              const SizedBox(height: 19),
              CustomTextFiled(
                icon: Icons.lock_outlined,
                hintText: "Your password",
                isPassword: true,
              ),
              const SizedBox(height: 19),
              CustomTextFiled(
                icon: Icons.lock_outlined,
                hintText: "Confirm password",
                isPassword: true,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: CustomButton(text: "SIGN UP"),
              ),
              SizedBox(height: 36),
              SocialLoginOptions(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account? ", style: Styels.textStyle15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
