import 'package:flutter/material.dart';

class EventInfoTile extends StatelessWidget {
  const EventInfoTile({
    super.key,
    required this.date,
    required this.time,
    required this.imageIcon,
  });
  final String date;
  final String time;
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
            children: [Text(date), Text(time)],
          ),
        ),
      ],
    );
  }
}
