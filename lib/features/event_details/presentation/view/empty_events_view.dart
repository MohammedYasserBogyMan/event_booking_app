import 'package:event_booking_app/features/event_details/presentation/view/widget/Empty_event_view_body.dart';
import 'package:flutter/material.dart';

class EmptyEventsView extends StatelessWidget {
  const EmptyEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: EmptyEventViewBody()));
  }
}
