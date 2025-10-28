import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/attendees_avatars_row.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/invite_button.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.going,
    required this.event,
    required this.userRepo,
  });

  final int going;
  final EventModel event;
  final UserRepo userRepo;

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
          Expanded(
            child: event.attendeeIds.isEmpty
                ? Text(
                    "No one yet",
                    style: Styels.textStyleRegular15.copyWith(
                      color: AppColor.actionTextColor,
                    ),
                  )
                : AttendeesAvatarsRow(
                    event: event,
                    userRepo: userRepo,
                    avatarRadius: 15,
                    spacing: 4,
                    showGoingText: true,
                    textStyle: Styels.textStyleRegular15.copyWith(
                      color: AppColor.actionTextColor,
                    ),
                  ),
          ),
          InviteButton(),
        ],
      ),
    );
  }
}
