import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/sign_out_view_body.dart';
import 'package:flutter/material.dart';

class SignOutView extends StatelessWidget {
  const SignOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Out", style: Styels.textStyle24),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: SignOutViewBody(),
    );
  }
}
