import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/widgets/search_and_filter_section.dart';
import 'package:event_booking_app/core/widgets/news_list.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchAndFilterSection(colors: SearchFilterColor.primaryTheme),
        ),
        const SizedBox(height: 20),
        Expanded(child: NewsList()),
      ],
    );
  }
}
