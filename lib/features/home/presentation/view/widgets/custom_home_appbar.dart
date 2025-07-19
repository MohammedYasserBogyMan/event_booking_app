import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Icon(Icons.menu, color: Colors.white, size: 30),
        ),
        Column(
          children: [
            Text(
              'Current Location',
              style: Styels.textStyle12.copyWith(
                color: Colors.white.withAlpha(150),
              ),
            ),
            Row(
              children: [
                Text(
                  'New York, USA',
                  style: Styels.textStyle14.copyWith(color: Colors.white),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ],
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(20),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
