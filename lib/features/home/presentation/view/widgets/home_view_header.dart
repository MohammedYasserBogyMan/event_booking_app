import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_home_appbar.dart';
import 'package:event_booking_app/core/widgets/search_and_filter_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff4A43EC),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(33)),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomHomeAppbar(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              child: SearchAndFilterSection(
                onSubmit: (p0) {},
                colors: SearchFilterColor.transparentTheme,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
