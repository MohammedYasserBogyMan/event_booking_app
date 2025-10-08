import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class EditInterestsIcon extends StatelessWidget {
  const EditInterestsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(52, 86, 106, 255),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Icon(Icons.search, size: 20, color: AppColor.primary),
            Text(
              "CHANGE",
              style: Styels.textStyleRegular12.copyWith(color: AppColor.primary),
            ),
          ],
        ),
      ),
    );
  }
}
