import 'package:event_booking_app/features/home/presentation/view/widgets/events_list_view.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/upcomin_event_header.dart';
import 'package:flutter/material.dart';
import 'package:event_booking_app/core/models/event_model.dart';

class EventSection extends StatelessWidget {
  const EventSection({super.key, required this.title, required this.events});

  final String title;
  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeEventSectionHeader(title: title),
        const SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.sizeOf(context).width / (237 / 215),
          child: EventsListView(events: events),
        ),
      ],
    );
  }
}
