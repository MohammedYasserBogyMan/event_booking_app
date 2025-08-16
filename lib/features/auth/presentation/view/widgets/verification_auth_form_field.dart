import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificarionAuthFormFields extends StatelessWidget {
  VerificarionAuthFormFields({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: CustomButton(
              text: "Continue",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kHomeView);
              },
            ),
          ),
        ],
      ),
    );
  }
}
