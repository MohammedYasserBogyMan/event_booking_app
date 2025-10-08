import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class InterestsPadge extends StatelessWidget {
  const InterestsPadge({
    super.key,
    required this.text,
    this.color = AppColor.primary,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: Styels.textStyleRegular14.copyWith(color: Colors.white),
      ),
    );
  }
}
