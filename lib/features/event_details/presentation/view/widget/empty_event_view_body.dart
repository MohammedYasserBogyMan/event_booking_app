import 'package:event_booking_app/features/event_details/presentation/view/widget/event_header.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/event_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/past_event_empty_body.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/upcoming_empty_view_body.dart';

class EmptyEventViewBody extends StatefulWidget {
  const EmptyEventViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmptyEventViewBodyState createState() => _EmptyEventViewBodyState();
}

class _EmptyEventViewBodyState extends State<EmptyEventViewBody> {
  bool isUpcomingSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const EventHeader(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: EventToggleSwitch(
              isUpcomingSelected: isUpcomingSelected,
              onToggle: (value) {
                setState(() {
                  isUpcomingSelected = value;
                });
              },
            ),
          ),
          const SizedBox(height: 100),
          if (isUpcomingSelected)
            Expanded(child: const UpcomingEmptyContent())
          else
            const PastEmptyContent(),
        ],
      ),
    );
  }
}
