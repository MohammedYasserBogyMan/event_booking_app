import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/constants/cons.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(minutes: 1),
      backgroundColor: AppColor.primary,
      content: Center(
        child: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: kFont,
          ),
        ),
      ),
    ),
  );
}
