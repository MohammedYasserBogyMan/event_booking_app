import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
        ),
        Text("Events", style: Styels.textStyleRegular24),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
}
