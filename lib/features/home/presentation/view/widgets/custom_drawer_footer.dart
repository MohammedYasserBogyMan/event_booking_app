import 'package:event_booking_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomDrawerFooter extends StatelessWidget {
  const CustomDrawerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 150 / 46,
        child: Image(
          alignment: AlignmentDirectional.centerStart,
          image: AssetImage(AssetsData.proBadge),
        ),
      ),
    );
  }
}
