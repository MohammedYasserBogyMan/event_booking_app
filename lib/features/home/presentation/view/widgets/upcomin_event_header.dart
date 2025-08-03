import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          Text(title, style: Styels.textStyle18.copyWith(color: Colors.black)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSeeAllEvents);
                },
                child: Text(
                  'See All',
                  style: Styels.textStyle14.copyWith(
                    color: AppColor.menuWhiteIconColor,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: AppColor.menuWhiteIconColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
