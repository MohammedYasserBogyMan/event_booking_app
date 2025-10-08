import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/event_invitation/presentation/views/share_bottom_sheet.dart';
import 'package:event_booking_app/features/event_invitation/presentation/views/widgets/friends_invitation_list_view.dart';
import 'package:flutter/material.dart';

class InviteFriendSheet extends StatelessWidget {
  const InviteFriendSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Invite Friend", style: Styels.textStyleRegular24),
          const SizedBox(height: 7),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search, color: AppColor.primary),
              hintText: "Search",
              hintStyle: Styels.textStyleRegular16.copyWith(color: Colors.grey),
              border: _buildOutlineInputBorder(),
              enabledBorder: _buildOutlineInputBorder(),
              focusedBorder: _buildOutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 37),
          Flexible(child: FriendsInvitationListView()),
          const SizedBox(height: 12),
          CustomButton(
            text: 'INVITE',
            onPressed: () {
              goToBackScreen(context);
              showSheet(context, child: ShareBottomSheet());
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Color(0xffF0F0F0)),
    );
  }
}
