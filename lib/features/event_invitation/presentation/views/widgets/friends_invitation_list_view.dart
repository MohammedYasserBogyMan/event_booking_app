import 'package:event_booking_app/core/utils/frined_list.dart';
import 'package:event_booking_app/features/event_invitation/presentation/views/widgets/friend_list_tile.dart';
import 'package:flutter/material.dart';

class FriendsInvitationListView extends StatefulWidget {
  const FriendsInvitationListView({super.key});

  @override
  State<FriendsInvitationListView> createState() =>
      _FriendsInvitationListViewState();
}

class _FriendsInvitationListViewState extends State<FriendsInvitationListView> {
  final Set<int> selectedFriends = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        final isSelected = selectedFriends.contains(index);
        return FriendListTile(
          name: friend['name'],
          followers: friend['followers'],
          imageUrl: friend['image'],
          isSelected: isSelected,
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedFriends.remove(index);
              } else {
                selectedFriends.add(index);
              }
            });
          },
        );
      },
    );
  }
}