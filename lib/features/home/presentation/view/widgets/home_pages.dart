import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomePages {
  static const List<Widget> pages = [
    HomeViewBody(),
    Center(child: Text("Events")),
    Center(child: Text("Map")),
    Center(child: Text("Profile")),
  ];
}
