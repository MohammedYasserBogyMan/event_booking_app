import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_invitation/presentation/views/invite_friend_view.dart';
import 'package:flutter/material.dart';

class InviteButton extends StatelessWidget {
  const InviteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        showSheet(context, child: InviteFriendSheet());
      },
      child: Text("Invite", style: Styels.textStyleRegular14.copyWith(color: Colors.black)),
    );
  }
}
