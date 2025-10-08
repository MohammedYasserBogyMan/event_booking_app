import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/my_profile_view_body.dart';
import 'package:flutter/material.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const MyProfileViewBody(),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(title: Text("Profile", style: Styels.textStyleMedium24));
  }
}
