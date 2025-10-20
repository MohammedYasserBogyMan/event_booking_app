import 'package:event_booking_app/features/home/presentation/view/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:event_booking_app/core/models/event_model.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key, required this.events});
  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children:
    //         events.map((e) {
    //           return IntrinsicWidth(child: EventCard(event: e));
    //         }).toList(),
    //   ),
    // );
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: events.length,
      itemBuilder: (context, index) => EventCard(event: events[index]),
    );
  }
}
