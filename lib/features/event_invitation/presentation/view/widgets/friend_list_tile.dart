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
      title: Text(name, style: Styels.textStyle14),
      subtitle: Text(
        followers,
        style: Styels.textStyle12.copyWith(color: Colors.grey),
      ),
      trailing: Icon(
        isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
