import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/search/filters/filter_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection({
    super.key,
    required this.colors,
    required this.onSubmit,
  });
  final SearchFilterColor colors;
  final Function(String) onSubmit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSearchView);
      },
      child: Row(
        children: [
          Icon(Icons.search, color: colors.prefixIconColor, size: 30),
          SizedBox(width: 10),
          Container(height: 25, width: 1.5, color: colors.verticalDivderColor),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorColor:colors.cursorColor,
              onSubmitted: onSubmit,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(color: colors.hintTextColor),
              ),
              style: Styels.textStyle20,
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
      ),
    );
  }
}
