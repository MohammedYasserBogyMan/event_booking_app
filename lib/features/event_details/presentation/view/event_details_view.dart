import 'package:event_booking_app/features/event_details/presentation/view/widget/event_details_view_body.dart';
import 'package:flutter/material.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventDetailsViewBody(),
    );
  }
}
