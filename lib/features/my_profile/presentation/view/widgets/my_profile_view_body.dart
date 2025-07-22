import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/profile_action_button.dart';
import 'package:event_booking_app/core/widgets/profile_header.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/interests_section.dart';
import 'package:flutter/material.dart';

class MyProfileViewBody extends StatelessWidget {
  const MyProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ProfileHeader(
              name: "Abdallah",
              imageUrl: AssetsData.photoProfileOrganizer,
              followers: 350,
              following: 349,
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 220,
                child: ProfileActionButton(
                  isFilled: false,
                  onPressed: () {},
                  icon: Icons.edit_note_rounded,
                  text: "Edit Profile",
                ),
              ),
            ),
            const SizedBox(height: 35),
            Text("About Me", style: Styels.textStyle19),
            const SizedBox(height: 10),
            Text(
              """Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More""",
              style: Styels.textStyle16,
            ),
            const SizedBox(height: 40),
            InterestsSection(),
          ],
        ),
      ),
    );
  }
}
