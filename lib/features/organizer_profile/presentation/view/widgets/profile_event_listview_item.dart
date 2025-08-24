import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/helper/helper.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class ProfileEventListViewItem extends StatelessWidget {
  const ProfileEventListViewItem({super.key, required this.events});
  final EventModel events;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        color: AppColor.lightBackground,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 70,
                height: 100,
                child: Image(image: NetworkImage(events.imageUrl)),
              ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayFormat(dateTime: events.date),
                  style: Styels.textStyle12.copyWith(color: AppColor.primary),
                ),
                Text(
                  events.title,
                  style: Styels.textStyle18.copyWith(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
