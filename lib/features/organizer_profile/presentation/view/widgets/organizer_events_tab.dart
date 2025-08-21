import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/profile_event_listview_item.dart';
import 'package:flutter/material.dart';

class EventsTap extends StatelessWidget {
  const EventsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          // Replace with your static or sample widgets
          ProfileEventListViewItem(
            events: EventModel(
              attendeeCount: 2,
              publisherId: "12345",
              subLocation: "Sample Sub Location",
              imageUrl: "https://example.com/event1.jpg",
              description: "Sample event description",
              location: "Sample Location",
              price: 20,

              category: "Music",
              title: "Sample Event 1",
              date: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
