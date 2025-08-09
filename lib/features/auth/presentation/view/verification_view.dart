import 'package:event_booking_app/features/auth/presentation/view/widgets/verification_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  static String id = "VerificationView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: VerificationViewBody());
  }

  AppBar _buildAppBar() {
    return AppBar();
  }
}
