import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        color: AppColor.whitebackgroundColor,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image(image: AssetImage(AssetsData.eventLogo)),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1st  May- Sat -2:00 PM",
                  style: Styels.textStyle12.copyWith(color: AppColor.primary),
                ),
                Text(
                  "A virtual evening of \nsmooth jazz",
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
