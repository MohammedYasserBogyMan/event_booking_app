import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class LoginViewHeader extends StatelessWidget {
  const LoginViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AssetsData.logoMark)),
        const SizedBox(height: 8),
        Text(
          "EventHub",
          style: Styels.textStyleRegular35.copyWith(color: Color(0xff37364A)),
        ),
      ],
    );
  }
}
