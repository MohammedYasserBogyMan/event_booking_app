import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/assets.dart';
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
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            event.imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                // هنا المفروض احط الصورة في home view (abdallah)
                AssetsData.eventPhoto,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
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
