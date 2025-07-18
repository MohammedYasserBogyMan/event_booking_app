import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/reset_view_body.dart';
import 'package:flutter/material.dart';

class RessetPasswordView extends StatelessWidget {
  const RessetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(backgroundColor: AppColor.backgroundColor),
      body: ResetViewBody(),
    );
  }
}
