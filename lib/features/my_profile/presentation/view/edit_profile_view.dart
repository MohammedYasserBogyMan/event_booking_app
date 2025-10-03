import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complete Your Profile",
          style: Styels.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: EditProfileViewBody(user: user),
    );
  }
}
