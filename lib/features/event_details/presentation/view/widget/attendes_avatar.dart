import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AttendesAvatar extends StatelessWidget {
  final UserModel? user;
  final bool isPlaceholder;

  const AttendesAvatar({
    super.key,
    this.user,
    this.isPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 16,
      child: CircleAvatar(
        radius: 15,
        backgroundColor: isPlaceholder ? Colors.grey[300] : null,
        foregroundImage: isPlaceholder
            ? AssetImage(AssetsData.eventDetailLogo)
            : (user?.photoUrl != null && user!.photoUrl.isNotEmpty)
                ? CachedNetworkImageProvider(user!.photoUrl)
                : AssetImage(AssetsData.eventDetailLogo) as ImageProvider,
        child: isPlaceholder
            ? Icon(Icons.person, size: 16, color: Colors.grey[400])
            : null,
      ),
    );
  }
}
