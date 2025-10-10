import 'package:event_booking_app/core/utils/helpers.dart';
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
          onTap: () => openDrawer(context),
          child: Icon(Icons.menu, color: Colors.white, size: 30),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  'Current Location',
                  style: Styels.textStyleRegular12.copyWith(
                    color: const Color.fromARGB(162, 255, 255, 255),
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
            Text(
              'New York, USA',
              style: Styels.textStyleRegular13,
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
