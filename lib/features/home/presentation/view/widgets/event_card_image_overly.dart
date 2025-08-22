import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/models/event_model.dart';
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
        SizedBox(
          height: 130,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: event.imageUrl,
            fit: BoxFit.cover,
            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [DateTag(date: event.date), BookmarkIcon()],
          ),
        ),
      ],
    );
  }
}
