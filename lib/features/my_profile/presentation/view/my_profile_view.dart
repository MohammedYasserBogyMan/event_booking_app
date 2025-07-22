import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/my_profile_view_body.dart';
import 'package:flutter/material.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: AppColor.whitebackgroundColor,
      body: MyProfileViewBody(),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: AppColor.whitebackgroundColor,
      title: Text("Profile", style: Styels.textStyle24),
    );
  }
}
