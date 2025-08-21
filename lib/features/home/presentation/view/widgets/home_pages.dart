import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/my_profile_view.dart';
import 'package:flutter/material.dart';

class HomePages {
  static const List<Widget> pages = [
    HomeViewBody(),
    Center(child: Text("Events")),
    Center(child: Text("Map")),
    MyProfileView(),
  ];
}
