import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColor.menuWhiteIconColor),
        SizedBox(width: 10),
        Text(text, style: Styels.textStyle16),
      ],
    );
  }
}
