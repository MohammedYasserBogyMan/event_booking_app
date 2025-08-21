import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/profile_event_listview_item.dart';
import 'package:flutter/material.dart';

class EventsTap extends StatelessWidget {
  const EventsTap({super.key, required this.events});

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(child: Text("No events found."));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ProfileEventListViewItem(events: events[index]);
        },
      ),
    );
  }
}
