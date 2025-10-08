import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UpcomingEmptyContent extends StatelessWidget {
  const UpcomingEmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Image.asset(
              AssetsData.emptyEventsIllustration,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 30),
            Text('No Upcoming Events', style: Styels.textStyleRegular24),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          child: CustomButton(text: 'EXPLORE EVENTS', onPressed: () {}),
        ),
      ],
    );
  }
}
