import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/utils/assets.dart';
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
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          backgroundImage:
              organizerEventPhoto.isNotEmpty &&
                      organizerEventPhoto.startsWith('http')
                  ? CachedNetworkImageProvider(organizerEventPhoto)
                  : AssetImage(AssetsData.defaultPhotoForNewUser),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(name), Text(job)],
          ),
        ),
        const Spacer(),
        const FollowButton(text: "Follow"),
      ],
    );
  }
}
