import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/event_details_view_body.dart';
import 'package:flutter/material.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EventDetailsViewBody(event: event));
  }
}
