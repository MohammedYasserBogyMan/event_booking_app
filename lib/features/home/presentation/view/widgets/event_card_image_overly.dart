import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/widgets/custom_event_image.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_book_mark_icon.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_date_tag.dart';
import 'package:flutter/material.dart';

class EventImageWithOverlay extends StatelessWidget {
  final EventModel event;

  const EventImageWithOverlay({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 10,
          child: CustomEventImage(eventModel: event),
        ),
        Positioned(
          top: 8,
          left: 8,
          right: 8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [DateTag(date: event.date), Align(child: BookmarkIcon(eventId: event.id))],
          ),
        ),
      ],
    );
  }
}
