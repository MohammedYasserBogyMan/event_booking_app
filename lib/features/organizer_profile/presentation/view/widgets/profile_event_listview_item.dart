import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/formatters.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_event_image.dart';
import 'package:flutter/material.dart';

class ProfileEventItem extends StatelessWidget {
  const ProfileEventItem({super.key, required this.events});
  final EventModel events;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.9,
      child: Card(
        shadowColor: const Color.fromARGB(50, 158, 158, 158),
        elevation: 10,
        color: AppColor.lightBackground,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: .85,
                child: CustomEventImage(eventModel: events),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayFormat(dateTime: events.date),
                    style: Styels.textStyleMedium12,
                  ),
                  const SizedBox(height: 5),
                  Text(events.title, style: Styels.textStyleMedium18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
