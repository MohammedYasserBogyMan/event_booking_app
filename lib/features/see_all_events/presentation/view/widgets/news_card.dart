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
        elevation: 1,
        color: AppColor.lightBackground,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image(image: AssetImage(AssetsData.eventLogo)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wed, Apr 28 •5:30 PM",
                  style: Styels.textStyle14.copyWith(color: AppColor.primary),
                ),
                Text(
                  "Jo Malone London’s Mother’s \nDay Presents",
                  style: Styels.textStyle15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: AppColor.orTextColor),
                    Text(
                      "Radius Gallery • Santa Cruz, CA",
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
