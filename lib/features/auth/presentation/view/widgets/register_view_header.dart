import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class RegisterViewHeader extends StatelessWidget {
  const RegisterViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Sign up",
      child: Text("Sign up", style: Styels.textStyle24),
    );
  }
}

