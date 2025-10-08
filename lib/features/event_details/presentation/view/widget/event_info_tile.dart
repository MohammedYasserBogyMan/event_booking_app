import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class EventInfoTile extends StatelessWidget {
  const EventInfoTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageIcon,
  });
  final String title;
  final String subtitle;
  final String imageIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: AssetImage(imageIcon)),
        Padding(
          padding: EdgeInsets.only(left: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styels.textStyleRegular16.copyWith(
                  color: Color(0xff120D26),
                ),
              ),
              Text(
                subtitle,
                style: Styels.textStyleRegular12.copyWith(
                  color: Color(0xff747688),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
