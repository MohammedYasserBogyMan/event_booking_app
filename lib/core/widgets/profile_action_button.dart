import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.isFilled,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor:
              isFilled ? AppColor.lightBackground : AppColor.primary,
          backgroundColor:
              isFilled ? AppColor.primary : AppColor.lightBackground,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.primary),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            const Spacer(),
            Text(text, style: Styels.textStyleRegular24),
          ],
        ),
      ),
    );
  }
}
