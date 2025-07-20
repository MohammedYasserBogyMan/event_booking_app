import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection({super.key, required this.colors});
  final SearchFilterColor colors;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.search, color: colors.prefixIconColor, size: 30),
        SizedBox(width: 10),
        Container(height: 25, width: 1.5, color: colors.verticalDivderColor),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: colors.hintTextColor),
              border: InputBorder.none,
            ),
            style: Styels.textStyle20,
          ),
        ),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: colors.filterBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(Icons.tune, color: colors.filterIconColor),
              SizedBox(width: 5),
              Text('Filters', style: TextStyle(color: colors.filterTextColor)),
            ],
          ),
        ),
      ],
    );
  }
}
