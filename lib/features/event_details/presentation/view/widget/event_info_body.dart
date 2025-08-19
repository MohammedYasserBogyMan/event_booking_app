import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/about_section.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/event_info_tile.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/organizer_info_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventInfoBody extends StatelessWidget {
  const EventInfoBody({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text("International Band \nMusic Concert", style: Styels.textStyle35),
        const SizedBox(height: 20),
        EventInfoTile(
          imageIcon: AssetsData.dateIcon,
          date: "14 December, 2021",
          time: "Tuesday, 4:00PM - 9:00PM",
        ),
        const SizedBox(height: 15),
        EventInfoTile(
          imageIcon: AssetsData.mapIcon,
          date: "Gala Convention Center",
          time: "36 Guild Street London, UK ",
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kOrganizerProfile);
          },
          child: OrganizerInfoCard(
            organizerEventPhoto: AssetsData.organizerEventPhoto,
            name: "Ashfak Sayem",
            job: "Organizer",
          ),
        ),
        const SizedBox(height: 40),
        AboutSection(
          aboutDescription:
              """Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More""",
        ),
      ],
    );
  }
}
