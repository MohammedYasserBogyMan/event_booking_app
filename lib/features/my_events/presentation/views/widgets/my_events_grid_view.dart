import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/my_events/presentation/views/widgets/my_event_card.dart';
import 'package:flutter/material.dart';

class MyEventsGridView extends StatelessWidget {
  final List<EventModel> events;

  const MyEventsGridView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Will be handled by the cubit
      },
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: events.length,
        itemBuilder: (context, index) {
          return MyEventCard(event: events[index]);
        },
      ),
    );
  }
}
