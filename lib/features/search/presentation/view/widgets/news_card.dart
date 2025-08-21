import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/helper/helper.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/search/data/models/event_ui_model.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.eventUiModel});
  final EventUiModel eventUiModel;

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
                width: 140,
                child: Image(image: NetworkImage(eventUiModel.imageUrl)),
              ),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dateFormat(dateTime: eventUiModel.day),
                  style: Styels.textStyle12.copyWith(color: AppColor.primary),
                ),
                Text(
                  eventUiModel.title,
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
