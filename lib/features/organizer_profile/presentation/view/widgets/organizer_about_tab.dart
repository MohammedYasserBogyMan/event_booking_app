import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.aboutText});
  final String aboutText;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(aboutText, style: Styels.textStyleMedium22));
  }
}
