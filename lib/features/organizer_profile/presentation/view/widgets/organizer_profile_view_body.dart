import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/widgets/profile_action_button.dart';
import 'package:event_booking_app/core/widgets/profile_header.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/tab_bar_section.dart';
import 'package:flutter/material.dart';

class OrganizerProfileViewBody extends StatelessWidget {
  const OrganizerProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 25),
          ProfileHeader(
            name: "David  Silbia",
            imageUrl: AssetsData.photoProfileOrganizer,
            followers: 390,
            following: 700,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ProfileActionButton(
                  onPressed: () {},
                  icon: Icons.person_add_alt_1_outlined,
                  text: "Follow",
                  isFilled: true,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: ProfileActionButton(
                  onPressed: () {},
                  icon: Icons.message_outlined,
                  text: "Message",
                  isFilled: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(child: TabBarSection()),
        ],
      ),
    );
  }
}
