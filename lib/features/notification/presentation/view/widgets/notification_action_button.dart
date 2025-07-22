import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class NotificationActionButton extends StatelessWidget {
  const NotificationActionButton({
    super.key,
    required this.text,
    required this.isFilled,
  });
  final String text;
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: isFilled ? AppColor.primary : Color(0xff706D6D),
          ),
          borderRadius: BorderRadius.circular(15),
          color: isFilled ? AppColor.primary : Colors.white,
        ),
        child: Text(
          text,
          style: Styels.textStyle14.copyWith(
            color: isFilled ? Colors.white : Color(0xff706D6D),
          ),
        ),
      ),
    );
  }
}
