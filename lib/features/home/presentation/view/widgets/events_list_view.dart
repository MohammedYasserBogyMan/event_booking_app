import 'package:event_booking_app/core/utils/category_list.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final events = categoryEvents[0];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}
