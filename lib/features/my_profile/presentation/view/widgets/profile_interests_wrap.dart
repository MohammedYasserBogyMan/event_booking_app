import 'package:event_booking_app/features/my_profile/data/model/interests_padge_model.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/interests_padge.dart';
import 'package:flutter/material.dart';

class ProfileInterestsWrap extends StatelessWidget {
  ProfileInterestsWrap({super.key});
  final List<InterestsPadgeModel> interests = [
    InterestsPadgeModel(title: "Games Online"),
    InterestsPadgeModel(title: "Concert", color: Color(0xffEE544A)),
    InterestsPadgeModel(title: "Music", color: Color(0xffFF8D5D)),
    InterestsPadgeModel(title: "Art"),
    InterestsPadgeModel(title: "Movie", color: Color(0xff29D697)),
    InterestsPadgeModel(title: "Others", color: Color(0xff39D1F2)),
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 5,
      children:
          interests.map((interest) {
            return InterestsPadge(text: interest.title, color: interest.color);
          }).toList(),
    );
  }
}
