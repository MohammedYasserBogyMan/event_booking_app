import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBarBackground extends StatelessWidget {
  const CustomAppBarBackground({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * 0.255,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.homeAppBarColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(33)),
      ),
      child: child,
    );
  }
}
