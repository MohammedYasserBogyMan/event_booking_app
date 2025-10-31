  import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
    return AppBar(
      title: Text("Sign Out", style: Styels.textStyleRegular24),
      centerTitle: true,
      backgroundColor: AppColor.primary,
    );
  }