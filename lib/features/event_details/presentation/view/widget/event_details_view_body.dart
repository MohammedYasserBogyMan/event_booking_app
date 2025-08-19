import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/buy_ticket_overlay_button.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/custom_app_bar.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/event_info_body.dart';
import 'package:flutter/material.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, required this.event});
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            CustomAppBar(eventModel: event),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: EventInfoBody(eventModel: event),
              ),
            ),
          ],
        ),
        BuyTicketOverlayButton(eventModel: event),
      ],
    );
  }
}
