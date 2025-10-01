import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/services/shared_prefs_service.dart';
import 'package:flutter/material.dart';

class SwitchIcon extends StatefulWidget {
  const SwitchIcon({super.key});

  @override
  State<SwitchIcon> createState() => _SwitchIconState();
}

class _SwitchIconState extends State<SwitchIcon> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveTrackColor: AppColor.lightBackground,
      value: rememberMe,
      activeColor: AppColor.lightBackground,
      activeTrackColor: AppColor.primary,
      onChanged: (bool value) {
        setState(() {
          SharedPrefsService.I.setRememberMe(value);
          rememberMe = value;
        });
      },
    );
  }
}
