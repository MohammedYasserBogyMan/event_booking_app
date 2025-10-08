import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class HomeEventSectionHeader extends StatelessWidget {
  const HomeEventSectionHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styels.textStyleMedium18.copyWith(color: Color(0xff120D26)),
          ),
          GestureDetector(
            onTap: () {
              pushToNewScreen(
                context,
                locationOfNewScreen: AppRouter.kSeeAllEvents,
              );
            },
            child: Row(
              children: [
                Text(
                  'See All',
                  style: Styels.textStyleRegular14.copyWith(
                    color: AppColor.menuWhiteIconColor,
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.arrow_right,
                  size: 25,
                  color: AppColor.menuWhiteIconColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
