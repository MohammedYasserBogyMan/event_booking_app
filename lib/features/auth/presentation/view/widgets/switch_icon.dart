import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class SwitchIcon extends StatefulWidget {
  const SwitchIcon({super.key});

  @override
  State<SwitchIcon> createState() => _SwitchIconState();
}

class _SwitchIconState extends State<SwitchIcon> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      activeColor:AppColor.lightBackground,
      activeTrackColor:AppColor.primary,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}