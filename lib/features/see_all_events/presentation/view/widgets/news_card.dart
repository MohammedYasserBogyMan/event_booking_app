import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/formatters.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_event_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Card(
        shadowColor: const Color.fromARGB(70, 158, 158, 158),
        elevation: 5,
        color: AppColor.lightBackground,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: .89,
                child: CustomEventImage(eventModel: eventModel),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayFormat(dateTime: eventModel.date),
                    style: Styels.textStyleRegular14.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    eventModel.title,
                    style: Styels.textStyleRegular15.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: AppColor.orTextColor),
                      Text(
                        eventModel.location,
                        style: Styels.textStyleRegular15.copyWith(
                          color: AppColor.orTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
