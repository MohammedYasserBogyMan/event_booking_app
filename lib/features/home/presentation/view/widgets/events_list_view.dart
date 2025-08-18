import 'package:event_booking_app/features/home/presentation/view/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:event_booking_app/core/models/event_model.dart';

class EventsListView extends StatelessWidget {
  final List<EventModel> events;

  const EventsListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}
