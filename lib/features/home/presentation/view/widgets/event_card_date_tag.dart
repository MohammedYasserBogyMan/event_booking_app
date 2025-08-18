import 'package:intl/intl.dart';

import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class DateTag extends StatelessWidget {
  final DateTime date;

  const DateTag({required this.date});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM').format(date);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        formattedDate,
        style: Styels.textStyle16.copyWith(color: const Color(0xffEB5757)),
      ),
    );
  }
}
