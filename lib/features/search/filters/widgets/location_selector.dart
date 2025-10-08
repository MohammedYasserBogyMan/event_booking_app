import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Location", style: Styels.textStyleMedium16),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/LocationIcon.png', height: 40),

              SizedBox(width: 18),
              Text("New York, USA", style: Styels.textStyleMedium16),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColor.primary,
                weight: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
