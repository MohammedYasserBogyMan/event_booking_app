import 'package:event_booking_app/features/event_details/presentation/view/widget/follow_button.dart';
import 'package:flutter/material.dart';

class OrganizerInfoCard extends StatelessWidget {
  const OrganizerInfoCard({
    required this.organizerEventPhoto,
    super.key,
    required this.name,
    required this.job,
  });
  final String name;
  final String job;
  final String organizerEventPhoto;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(width: 44, height: 44, image: AssetImage(organizerEventPhoto)),
        Padding(
          padding: EdgeInsets.only(left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(name), Text(job)],
          ),
        ),
        Spacer(),
        FollowButton(text: "Follow"),
      ],
    );
  }
}
