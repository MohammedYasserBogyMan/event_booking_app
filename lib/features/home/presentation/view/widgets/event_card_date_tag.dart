import 'package:intl/intl.dart';

import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class DateTag extends StatelessWidget {
  final DateTime date;

  const DateTag({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final formattedDay = DateFormat('dd').format(date);
    final formattedMonth = DateFormat('MMM').format(date);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(170, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            formattedDay,
            style: Styels.textStyleBold18.copyWith(
              color: const Color(0xffEB5757),
            ),
          ),
          Text(
            formattedMonth,
            style: Styels.textStyleMedium18.copyWith(
              color: const Color(0xffEB5757),
            ),
          ),
        ],
      ),
    );
  }
}
