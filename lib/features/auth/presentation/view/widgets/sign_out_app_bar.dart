import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

AppBar signOutbuildAppBar() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(
      "Sign Out",
      style: Styels.textStyleRegular24.copyWith(color: Colors.white),
    ),
    centerTitle: true,
    backgroundColor: AppColor.primary,
  );
}
