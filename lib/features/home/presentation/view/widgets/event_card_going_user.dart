import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class GoingUsersSection extends StatelessWidget {
  final int going;

  const GoingUsersSection({super.key, required this.going});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 10,
          backgroundImage: AssetImage(AssetsData.eventDetailLogo),
        ),
        const SizedBox(width: 4),
        const CircleAvatar(
          radius: 10,
          backgroundImage: AssetImage(AssetsData.eventDetailLogo),
        ),
        const SizedBox(width: 4),
        const CircleAvatar(
          radius: 10,
          backgroundImage: AssetImage(AssetsData.eventDetailLogo),
        ),
        const SizedBox(width: 10),
        Text(
          '+$going Going',
          style: Styels.textStyleMedium12.copyWith(
            color: AppColor.actionTextColor,
          ),
        ),
      ],
    );
  }
}
