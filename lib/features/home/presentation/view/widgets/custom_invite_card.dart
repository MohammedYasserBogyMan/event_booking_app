import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_invitation/presentation/views/invite_friend_view.dart';
import 'package:flutter/material.dart';

class CustomInviteCard extends StatelessWidget {
  const CustomInviteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 328 / 127,
      child: LayoutBuilder(
        builder: (context, constrains) {

          var maxWidthOfNowScreen = constrains.maxWidth;
          var maxHeightOfNowScreen = constrains.maxHeight;


          /// base data of a Card
          const baseWidthOfCard = 328;
          const baseHeightOfCard = 127;
          const baseScaleOfCard = 3.2;
          const baseAlignXOfCard = 1;
          const baseAlignYOfCard = -.9;

          /// النسبة الي كبر فيها العرض والطول في التليفون الجديد قد ايه ؟
          final widthRatio = maxWidthOfNowScreen / baseWidthOfCard;
          final heightRatio = maxHeightOfNowScreen / baseHeightOfCard;

          // القيم الجديدة الي هتخلي الشكل responsive 
          final newScale = baseScaleOfCard / widthRatio;
          final newAlignX = baseAlignXOfCard * widthRatio;
          final newAlignY = baseAlignYOfCard * heightRatio;

          return Container(
            padding: EdgeInsets.all(17),
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xffD6FEFF),
              image: DecorationImage(
                scale: newScale,
                alignment: Alignment(newAlignX, newAlignY),
                fit: BoxFit.none,
                image: AssetImage(AssetsData.inviteImage),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Invite your friends", style: Styels.textStyleMedium18),
                Text(
                  r"Get $20 for ticket",
                  style: Styels.textStyleRegular13.copyWith(
                    color: Color(0xff484D70),
                  ),
                ),
                const SizedBox(height: 13),
                ElevatedButton(
                  onPressed: () {
                    showSheet(context, child: InviteFriendSheet());
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff00F8FF),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'INVITE',
                    style: Styels.textStyleMedium12.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
