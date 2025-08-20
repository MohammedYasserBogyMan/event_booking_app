import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/attendes_avatar.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/invite_button.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.going});
  final int going;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 400,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AttendesAvatar(),
              AttendesAvatar(),
              AttendesAvatar(),
              SizedBox(width: 5),
              Text(
                "+$going Going",
                style: Styels.textStyle15.copyWith(color: AppColor.primary),
              ),
            ],
          ),
          InviteButton(),
        ],
      ),
    );
  }
}
