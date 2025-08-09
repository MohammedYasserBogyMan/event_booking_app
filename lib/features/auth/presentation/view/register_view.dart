import 'package:event_booking_app/features/auth/presentation/view/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: RegisterViewBody());
  }

  AppBar _buildAppBar() {
    return AppBar();
  }
}
