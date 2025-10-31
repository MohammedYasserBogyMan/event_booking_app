import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/upcomin_event_header.dart';
import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key, required this.events});
  final List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeEventSectionHeader(title: "Upcoming Events"),
        const SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .35,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children:
                    events
                        .map((event) => EventCard(event: event))
                        .take(3)
                        .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
