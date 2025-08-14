import 'package:event_booking_app/features/auth/presentation/view/widgets/verification_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key,  this.email});
  static String id = "VerificationView";
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: VerificationViewBody(email:email ,));
  }

  AppBar _buildAppBar() {
    return AppBar();
  }
}
