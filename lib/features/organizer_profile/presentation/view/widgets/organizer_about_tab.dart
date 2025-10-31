import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.aboutText});
  final String aboutText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            aboutText,
            style: Styels.textStyleRegular16.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
