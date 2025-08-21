// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:event_booking_app/features/organizer_profile/presentation/manager/organizer_events/cubit/organizer_events_cubit.dart';
import 'package:flutter/material.dart';

import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/organizer_about_tab.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/organizer_events_tab.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/organizer_reviews_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key, required this.aboutUser});
  final String aboutUser;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizerEventsCubit, OrganizerEventsState>(
      builder: (context, state) {
        if (state is OrganizerEventsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrganizerEventsFailure) {
          return Center(child: Text(state.message));
        } else if (state is OrganizerEventsSuccess) {
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
                    children: [
                      AboutTab(aboutText: aboutUser),
                      EventsTap(events: state.events),
                      ReviewsTap(),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
