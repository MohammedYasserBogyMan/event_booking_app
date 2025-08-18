import 'package:event_booking_app/features/home/presentation/view/widgets/home_header_with_category.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_section.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/invite_card.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const double kSectionSpacing = 16.0;
  static const double kHeaderCategorySpacing = 60.0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: HomeHeaderWithCategory()),
        const SliverToBoxAdapter(
          child: SizedBox(height: kHeaderCategorySpacing),
        ),

        // Upcoming
        const SliverToBoxAdapter(child: EventSection(title: 'Upcoming Events')),
        const SliverToBoxAdapter(child: SizedBox(height: kSectionSpacing)),

        // Invite Card
        const SliverToBoxAdapter(child: InviteCard()),
        const SliverToBoxAdapter(child: SizedBox(height: kSectionSpacing)),

        // Nearby
        const SliverToBoxAdapter(child: EventSection(title: 'Nearby You')),
        const SliverToBoxAdapter(child: SizedBox(height: kSectionSpacing)),
      ],
    );
  }
}
