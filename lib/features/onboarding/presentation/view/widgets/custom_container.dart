import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * (288 / 812),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
      ),
      child: child,
    );
  }
}
