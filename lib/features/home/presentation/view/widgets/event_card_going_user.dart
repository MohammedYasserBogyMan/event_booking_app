import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/attendees_avatars_row.dart';
import 'package:flutter/material.dart';

class GoingUsersSection extends StatelessWidget {
  final EventModel event;
  final UserRepo userRepo;

  const GoingUsersSection({
    super.key,
    required this.event,
    required this.userRepo,
  });

  @override
  Widget build(BuildContext context) {
    return AttendeesAvatarsRow(
      event: event,
      userRepo: userRepo,
      avatarRadius: 10,
      spacing: 4,
      showGoingText: true,
      textStyle: Styels.textStyleMedium12.copyWith(
        color: AppColor.actionTextColor,
      ),
    );
  }
}
