import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class ResendCodeTimer extends StatelessWidget {
  const ResendCodeTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Re-send code in  ", style: Styels.textStyleRegular15.copyWith(color: Colors.black)),
        Text(
          "0:20",
          style: Styels.textStyleRegular15,
        ),
      ],
    );
  }
}
