import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_invitation/presentation/views/invite_friend_view.dart';
import 'package:flutter/material.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F7FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            bottom: 00,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AssetsData.inviteImage,
                height: 150,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14),
                  Text(
                    'Invite your friends',
                    style: Styels.textStyle18.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  const Text('Get \$20 for ticket', style: Styels.textStyle14),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      showSheet(context, child: InviteFriendSheet());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xff00F8FF),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'INVITE',
                      style: Styels.textStyle12.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
