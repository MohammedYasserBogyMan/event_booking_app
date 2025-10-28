import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
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
          backgroundImage: _getImageProvider(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Styels.textStyleRegular15.copyWith(
                  color: Color(0xff0D0C26),
                ),
              ),
              Text(
                job,
                style: Styels.textStyleRegular12,
              ),
            ],
          ),
        ),
        const Spacer(),
        const FollowButton(text: "Follow"),
      ],
    );
  }

  ImageProvider _getImageProvider() {
    if (organizerEventPhoto.isNotEmpty &&
        (organizerEventPhoto.startsWith('http://') ||
            organizerEventPhoto.startsWith('https://'))) {
      return CachedNetworkImageProvider(organizerEventPhoto);
    }
    return const AssetImage(AssetsData.defaultPhotoForNewUser);
  }
}
