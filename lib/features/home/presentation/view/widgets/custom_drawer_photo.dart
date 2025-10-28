import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomDrawerPhoto extends StatelessWidget {
  const CustomDrawerPhoto({
    super.key,
    required this.currentUser,
  });

  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: _getImageProvider(),
      radius: 30,
    );
  }

  ImageProvider _getImageProvider() {
    if (currentUser.photoUrl.isNotEmpty &&
        (currentUser.photoUrl.startsWith('http://') ||
            currentUser.photoUrl.startsWith('https://'))) {
      return CachedNetworkImageProvider(currentUser.photoUrl);
    }
    return const AssetImage(AssetsData.defaultPhotoForNewUser);
  }
}
