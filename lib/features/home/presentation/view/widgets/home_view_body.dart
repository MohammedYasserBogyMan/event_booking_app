import 'package:event_booking_app/core/utils/category_list.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_header.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/category_tap_home_view.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/invite_card.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/upcomin_event_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedCategoryIndex = 0;

  void onCategoryChanged(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderWithCategory(),
          const SizedBox(height: 60),
          const HomeEventSectionHeader(title: 'Upcoming Events'),
          SizedBox(
            height: 260,
            child: _buildCategoryContent(selectedCategoryIndex),
          ),
          const SizedBox(height: 16),
          const InviteCard(),

          const SizedBox(height: 16),
          const HomeEventSectionHeader(title: 'Nearby You'),

          SizedBox(
            height: 260,
            child: _buildCategoryContent(selectedCategoryIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContent(int index) {
    final events = categoryEvents[index];
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: events.map((event) => EventCard(event: event)).toList(),
    );
  }

  Widget _buildHeaderWithCategory() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const HomeViewHeader(),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height * 0.21,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: HomeViewCategorysTaps(
              selectedIndex: selectedCategoryIndex,
              onTap: onCategoryChanged,
            ),
          ),
        ),
      ],
    );
  }
}
