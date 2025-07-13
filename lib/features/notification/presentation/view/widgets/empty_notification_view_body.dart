import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class EmptyNotificationViewBody extends StatelessWidget {
  const EmptyNotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 170),
          Center(
            child: Image(
              width: 160,
              height: 190,
              image: AssetImage(AssetsData.emptyNotificationIllustration),
            ),
          ),
          const SizedBox(height: 40),
          Text("No Notifications!", style: Styels.textStyle16),
          const SizedBox(height: 8),

          Text(
            "Lorem ipsum dolor sit amet, consectetur ",
            style: Styels.textStyle16.copyWith(
              color: Color.fromARGB(158, 52, 75, 103),
            ),
          ),
          Text(
            "adipiscing elit sed do eiusmod tempor",
            style: Styels.textStyle16.copyWith(
              color: Color.fromARGB(158, 52, 75, 103),
            ),
          ),
        ],
      ),
    );
  }
}
