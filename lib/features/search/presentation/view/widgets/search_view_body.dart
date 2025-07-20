import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/widgets/search_and_filter_section.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchAndFilterSection(colors: SearchFilterColor.primaryTheme),
      ],
    );
  }
}
