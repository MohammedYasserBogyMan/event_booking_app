import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.followers,
    required this.following,
  });
  final String name;
  final String imageUrl;
  final int following;
  final int followers;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          backgroundImage:
              imageUrl.startsWith('http')
                  ? CachedNetworkImageProvider(imageUrl)
                  : AssetImage(AssetsData.defaultPhotoForNewUser)
                      as ImageProvider,
        ),
        SizedBox(height: 20),
        Text(name, style: Styels.textStyle24),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("$following", style: Styels.textStyle16),
                Text("Following", style: Styels.textStyle14),
              ],
            ),
            SizedBox(height: 35, child: VerticalDivider()),
            Column(
              children: [
                Text("$followers", style: Styels.textStyle16),
                Text("Followers", style: Styels.textStyle14),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
