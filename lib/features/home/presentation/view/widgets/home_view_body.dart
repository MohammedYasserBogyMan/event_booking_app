import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/constants/cons.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/data/model/event_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_header.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/category_tap_home_view.dart';
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
    return Column(
      children: [
        Stack(
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
        ),
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Events',
                style: Styels.textStyle18.copyWith(color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    'See All',
                    style: Styels.textStyle14.copyWith(
                      color: AppColor.menuWhiteIconColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: AppColor.menuWhiteIconColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(child: _buildCategoryContent(selectedCategoryIndex)),
      ],
    );
  }

  Widget _buildCategoryContent(int index) {
    final events = categoryEvents[index];
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      children: events.map((event) => EventCard(event: event)).toList(),
    );
  }
}

final List<List<EventModel>> categoryEvents = [
  [
    EventModel(
      title: "Local Football League",
      date: "15 JUL",
      location: "City Stadium",
      image: kenentimage,
      going: 12,
    ),
    EventModel(
      title: "Basketball Finals",
      date: "20 JUL",
      location: "National Arena",
      image: kenentimage,
      going: 25,
    ),
  ],

  [
    EventModel(
      title: "Jazz Night",
      date: "22 JUL",
      location: "Music Hall",
      image: kenentimage,
      going: 40,
    ),
    EventModel(
      title: "Indie Band Show",
      date: "25 JUL",
      location: "Downtown Club",
      image: kenentimage,
      going: 60,
    ),
  ],

  [
    EventModel(
      title: "International Food Festival",
      date: "18 JUL",
      location: "Central Park",
      image: kenentimage,
      going: 80,
    ),
    EventModel(
      title: "Street Food Carnival",
      date: "19 JUL",
      location: "Main Street",
      image: kenentimage,
      going: 45,
    ),
  ],

  [
    EventModel(
      title: "AI & ML Conference",
      date: "23 JUL",
      location: "Tech Center",
      image: kenentimage,
      going: 100,
    ),
    EventModel(
      title: "Startup Pitch Event",
      date: "24 JUL",
      location: "Innovation Hub",
      image: kenentimage,
      going: 30,
    ),
  ],

  [
    EventModel(
      title: "Modern Art Exhibition",
      date: "21 JUL",
      location: "City Art Gallery",
      image: kenentimage,
      going: 22,
    ),
    EventModel(
      title: "Photography Contest",
      date: "22 JUL",
      location: "Cultural Center",
      image: kenentimage,
      going: 18,
    ),
  ],
];
