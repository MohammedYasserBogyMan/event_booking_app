import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/frined_list.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/event_invitation/presentation/view/share_bottom_sheet.dart';
import 'package:event_booking_app/features/event_invitation/presentation/view/widgets/friend_list_tile.dart';
import 'package:flutter/material.dart';

class InviteFriendSheet extends StatefulWidget {
  const InviteFriendSheet({super.key});

  @override
  State<InviteFriendSheet> createState() => _InviteFriendSheetState();
}

class _InviteFriendSheetState extends State<InviteFriendSheet> {
  final Set<int> selectedFriends = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Invite Friend", style: Styels.textStyle24),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search, color: AppColor.primary),
              hintText: "Search",
              hintStyle: Styels.textStyle16.copyWith(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: AppColor.primary),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: ListView.builder(
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
            ),
          ),
          const SizedBox(height: 12),
          CustomButton(
            text: 'INVITE',
            onPressed: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (_) => const ShareBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
