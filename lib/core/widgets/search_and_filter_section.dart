import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/widgets/custom_search_text_field.dart';
import 'package:event_booking_app/features/search/filters/filter_view.dart';
import 'package:flutter/material.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection({
    super.key,
    required this.colors,
    required this.onSubmit,
    this.enabled = false,
  });
  final SearchFilterColor colors;
  final Function(String) onSubmit;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: "Search",
          child: Icon(Icons.search, color: colors.prefixIconColor, size: 30),
        ),
        SizedBox(width: 10),
        Container(height: 25, width: 1.5, color: colors.verticalDivderColor),
        SizedBox(width: 10),
        Expanded(
          child: CustomSearchTextField(
            colors: colors,
            onSubmit: onSubmit,
            enabled: enabled,
          ),
        ),
        GestureDetector(
          onTap: () {
            showFilterBottomSheet(context);
          },
          child: Container(
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
                Text(
                  'Filters',
                  style: TextStyle(color: colors.filterTextColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
