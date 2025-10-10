import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/formatters.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/search/data/models/event_ui_model.dart';
import 'package:event_booking_app/features/search/presentation/view/widgets/custom_search_event_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.eventUiModel});
  final EventUiModel eventUiModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.91,
      child: Card(
        elevation: 6,
        color: AppColor.lightBackground,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: 0.86,
                child: CustomSearchEventImage(eventModel: eventUiModel),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dateFormat(dateTime: eventUiModel.day),
                  style: Styels.textStyleMedium12,
                ),
                Text(eventUiModel.title, style: Styels.textStyleMedium18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
