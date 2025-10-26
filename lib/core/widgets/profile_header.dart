import 'dart:io';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/editable_profile_avatar.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.followers,
    required this.following,
    this.isEditable = false,
    this.onImageSelected,
  });
  final String name;
  final String imageUrl;
  final int following;
  final int followers;
  final bool isEditable;
  final Function(File)? onImageSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditableProfileAvatar(
          imageUrl: imageUrl,
          radius: 35,
          isEditable: isEditable,
          onImageSelected: onImageSelected,
        ),
        SizedBox(height: 20),
        Text(name, style: Styels.textStyleMedium24),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                children: [
                  Text("$following", style: Styels.textStyleMedium16),
                  Text("Following", style: Styels.textStyleRegular14),
                ],
              ),
            ),
            const SizedBox(height: 40, child: VerticalDivider()),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Text("$followers", style: Styels.textStyleMedium16),
                  Text("Followers", style: Styels.textStyleRegular14),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
