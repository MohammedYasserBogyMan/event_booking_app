import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
    scaffoldBackgroundColor: AppColor.lightBackground,
    appBarTheme: AppBarTheme(
      color: AppColor.lightBackground,
      elevation: 0,
    ),
    brightness: Brightness.light,
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.darkBackground,
    appBarTheme: AppBarTheme(elevation: 0, color: AppColor.darkBackground),
    brightness: Brightness.dark,
  );
}
