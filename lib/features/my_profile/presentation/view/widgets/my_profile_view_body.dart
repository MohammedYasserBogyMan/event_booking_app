import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/widgets/profile_header.dart';
import 'package:flutter/cupertino.dart';

class MyProfileViewBody extends StatelessWidget {
  const MyProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ProfileHeader(
          name: "Abdallah",
          imageUrl: AssetsData.photoProfileOrganizer,
          followers: 350,
          following: 349,
        ),
      ],
    );
  }
}
