import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/search/presentation/view/widgets/search_news_list.dart';
import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: AppColor.primary,
            indicatorColor: AppColor.primary,
            tabs: [
              Tab(text: "ABOUT"),
              Tab(text: "EVENTS"),
              Tab(text: "REVIEWS"),
            ],
          ),
          Expanded(
            child: TabBarView(children: [NewsList(), NewsList(), NewsList()]),
          ),
        ],
      ),
    );
  }
}
