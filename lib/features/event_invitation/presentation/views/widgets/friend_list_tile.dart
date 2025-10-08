import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class FriendListTile extends StatelessWidget {
  final String name;
  final String followers;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const FriendListTile({
    super.key,
    required this.name,
    required this.followers,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: Text(name, style: Styels.textStyleRegular14),
      subtitle: Text(
        followers,
        style: Styels.textStyleRegular12.copyWith(color: Colors.grey),
      ),
      trailing: Icon(
        isSelected ? Icons.check_circle : Icons.check_circle,
        color: isSelected ? AppColor.primary : Color(0xffE2E2E2),
      ),
      onTap: onTap,
    );
  }
}
