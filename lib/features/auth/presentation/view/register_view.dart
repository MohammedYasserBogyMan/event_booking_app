import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = "RegisterView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitebackgroundColor,
      appBar: _buildAppBar(),
      body: RegisterViewBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(backgroundColor: AppColor.whitebackgroundColor);
  }
}
