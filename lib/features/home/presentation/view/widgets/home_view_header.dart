import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_home_appbar.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/search_and_filter_appbar_section.dart';
import 'package:flutter/material.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomHomeAppbar(),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SearchAndFilterAppbarSection(),
          ),
        ],
      ),
    );
  }
}
