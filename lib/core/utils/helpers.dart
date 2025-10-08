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
        child: Text(message, style: TextStyle(fontSize: 20, fontFamily: kFont)),
      ),
    ),
  );
}

Future<dynamic> showSheet(BuildContext context, {required Widget child}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    context: context,
    backgroundColor: Colors.white,
    builder: (context) => child,
  );
}
