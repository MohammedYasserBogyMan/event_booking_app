import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.colors,
    required this.onSubmit,
    this.enabled = false,
  });

  final SearchFilterColor colors;
  final Function(String p1) onSubmit;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      cursorColor: colors.cursorColor,
      onSubmitted: onSubmit,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search...',
        hintStyle: TextStyle(color: colors.hintTextColor),
      ),
      style: Styels.textStyle20,
    );
  }
}
