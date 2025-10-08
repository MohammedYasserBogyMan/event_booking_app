import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/edit_interests_icon.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/profile_interests_wrap.dart';
import 'package:flutter/material.dart';

class InterestsSection extends StatelessWidget {
  const InterestsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Interest",
              style: Styels.textStyleMedium18.copyWith(
                color: Color(0xff172B4D),
              ),
            ),
            EditInterestsIcon(),
          ],
        ),
        SizedBox(height: 10),
        ProfileInterestsWrap(),
      ],
    );
  }
}
