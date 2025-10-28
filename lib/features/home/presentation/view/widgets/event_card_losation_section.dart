import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  final String location;

  const LocationSection({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, size: 22, color: Colors.grey),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            location,
            style: Styels.textStyleRegular14.copyWith(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
