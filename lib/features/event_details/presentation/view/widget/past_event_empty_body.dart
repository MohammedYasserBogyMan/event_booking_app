import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class PastEmptyContent extends StatelessWidget {
  const PastEmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 60),
        Text('No Past Events', style: Styels.textStyleRegular24),
      ],
    );
  }
}
