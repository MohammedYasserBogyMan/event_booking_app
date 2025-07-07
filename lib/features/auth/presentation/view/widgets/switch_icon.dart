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
      activeColor: Colors.white,
      activeTrackColor: Color(0xff5669FF),
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}