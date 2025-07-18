import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HomeViewHeader()]);
  }
}
