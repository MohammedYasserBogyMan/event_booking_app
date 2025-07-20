import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class SearchFilterColor {
  final Color prefixIconColor;
  final Color verticalDivderColor;
  final Color hintTextColor;
  final Color filterBackgroundColor;
  final Color filterIconColor;
  final Color filterTextColor;
  const SearchFilterColor({
    required this.prefixIconColor,
    required this.verticalDivderColor,
    required this.hintTextColor,
    required this.filterBackgroundColor,
    required this.filterIconColor,
    required this.filterTextColor,
  });

  static const SearchFilterColor transparentTheme = SearchFilterColor(
    prefixIconColor: Colors.white,
    verticalDivderColor: Color.fromARGB(71, 255, 255, 255),
    hintTextColor: Color.fromARGB(71, 255, 255, 255),
    filterBackgroundColor: Color.fromARGB(22, 255, 255, 255),
    filterIconColor: Colors.white,
    filterTextColor: Colors.white,
  );
  static const SearchFilterColor primaryTheme = SearchFilterColor(
    prefixIconColor: AppColor.primary,
    verticalDivderColor: AppColor.primary,
    hintTextColor: Colors.grey,
    filterBackgroundColor: AppColor.primary,
    filterIconColor: Colors.white,
    filterTextColor: Colors.white,
  );
}
