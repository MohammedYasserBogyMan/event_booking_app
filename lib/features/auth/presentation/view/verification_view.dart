import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/features/auth/presentation/view/widgets/verification_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(child: VerificationViewBody(userModel: userModel)),
    );
  }


}
