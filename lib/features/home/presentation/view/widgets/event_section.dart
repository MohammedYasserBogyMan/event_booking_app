import 'package:event_booking_app/features/home/presentation/view/widgets/events_list_view.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/upcomin_event_header.dart';
import 'package:flutter/material.dart';
import 'package:event_booking_app/core/models/event_model.dart';

class EventSection extends StatelessWidget {
  final String title;
  final List<EventModel> events;

  const EventSection({super.key, required this.title, required this.events});

  static const double kEventCardHeight = 260.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeEventSectionHeader(title: title),
        SizedBox(
          height: kEventCardHeight,
          child: EventsListView(events: events),
        ),
      ],
    );
  }
}
