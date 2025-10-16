import 'package:event_booking_app/features/bookmarks/presentation/view/bookmarks_view.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/my_profile_view.dart';
import 'package:flutter/material.dart';

import '../../../../my_events/presentation/views/my_events_view.dart';

class HomePages {
  static List<Widget> pages = [
    const HomeViewBody(),
    const MyEventsView(),
    const BookmarksView(),
    MyProfileView(),
  ];
}
