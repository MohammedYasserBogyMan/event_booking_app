import 'package:event_booking_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomDrawerFooter extends StatelessWidget {
  const CustomDrawerFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image(
        width: 150,
        height: 50,
        image: AssetImage(AssetsData.proBadge),
      ),
    );
  }
}
