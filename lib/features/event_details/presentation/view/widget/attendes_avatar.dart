import 'package:event_booking_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AttendesAvatar extends StatelessWidget {
  const AttendesAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 16,
      child: CircleAvatar(
        radius: 15,
        foregroundImage: AssetImage(AssetsData.eventDetailLogo),
      ),
    );
  }
}
