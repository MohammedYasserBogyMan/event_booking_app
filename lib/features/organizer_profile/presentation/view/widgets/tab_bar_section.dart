// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/organizer_about_tab.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/organizer_events_tab.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/organizer_reviews_tab.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key, required this.organizerId});
  final String organizerId;

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
            child: TabBarView(
              children: [AboutTab(), EventsTap(), ReviewsTap()],
            ),
          ),
        ],
      ),
    );
  }
}
