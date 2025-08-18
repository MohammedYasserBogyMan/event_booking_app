import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_going_user.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_image_overly.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_losation_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kEventDetailsView);
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventImageWithOverlay(event: event),
            const SizedBox(height: 10),
            Text(
              event.title,
              style: Styels.textStyle18.copyWith(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            GoingUsersSection(going: event.going),
            const SizedBox(height: 6),
            LocationSection(location: event.location),
          ],
        ),
      ),
    );
  }
}
