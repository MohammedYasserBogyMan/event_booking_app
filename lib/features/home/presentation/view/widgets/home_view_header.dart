import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_app_bar_background.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_home_appbar.dart';
import 'package:event_booking_app/core/widgets/search_and_filter_section.dart';
import 'package:flutter/material.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBarBackground(
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
                pushToNewScreen(
                  context,
                  locationOfNewScreen: AppRouter.kSearchView,
                );
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
