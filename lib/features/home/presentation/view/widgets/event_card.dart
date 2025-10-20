import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_going_user.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_image_overly.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card_losation_section.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 237 / 255,
      child: GestureDetector(
        onTap: () {
          pushToNewScreen(
            context,
            locationOfNewScreen: AppRouter.kEventDetailsView,
            extra: event,
          );
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.2,
          height: MediaQuery.sizeOf(context).height * 0.4,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EventImageWithOverlay(event: event),
              const SizedBox(height: 14),
              Text(
                event.title,
                style: Styels.textStyleMedium18,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              GoingUsersSection(going: event.attendeeCount),
              const SizedBox(height: 10),
              LocationSection(location: event.location),
            ],
          ),
        ),
      ),
    );
  }
}
