import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/helper/helper.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 1,
        color: AppColor.lightBackground,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 140,
                child: Image.network(eventModel.imageUrl),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayFormat(dateTime: eventModel.date),
                  style: Styels.textStyle14.copyWith(color: AppColor.primary),
                ),
                Text(eventModel.title, style: Styels.textStyle15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: AppColor.orTextColor),
                    Text(
                      eventModel.location,
                      style: Styels.textStyle14.copyWith(
                        color: AppColor.orTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
