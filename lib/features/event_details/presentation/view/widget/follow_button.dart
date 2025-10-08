import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        foregroundColor: AppColor.primary,
        backgroundColor: Color(0xffEAEDFF),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
