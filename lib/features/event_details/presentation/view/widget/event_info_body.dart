import 'package:event_booking_app/core/helper/helper.dart';
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
        Text(eventModel.title, style: Styels.textStyle35),
        const SizedBox(height: 20),
        EventInfoTile(
          imageIcon: AssetsData.dateIcon,
          title: dateFormat(dateTime: eventModel.date),
          subtitle:
              "${dayFormat(dateTime: eventModel.date)} ${timeRange(dateTime: eventModel.date, dateTime2: eventModel.date)}",
        ),
        const SizedBox(height: 15),
        EventInfoTile(
          imageIcon: AssetsData.mapIcon,
          title: eventModel.location,
          subtitle: eventModel.subLocation,
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
        AboutSection(aboutDescription: eventModel.description),
      ],
    );
  }
}
