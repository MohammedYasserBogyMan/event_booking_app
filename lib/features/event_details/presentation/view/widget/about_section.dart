import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.aboutDescription});
  final String aboutDescription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("About Event", style: Styels.textStyle19),
        SizedBox(height: 10),
        Text(aboutDescription, style: Styels.textStyle16),
      ],
    );
  }
}
