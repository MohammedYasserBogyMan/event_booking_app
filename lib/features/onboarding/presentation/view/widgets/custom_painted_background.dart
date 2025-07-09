import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomPaintedBackground extends StatelessWidget {
  const CustomPaintedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
      ),
    );
  }
}
