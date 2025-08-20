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
            children: [Text(title), Text(subtitle)],
          ),
        ),
      ],
    );
  }
}
