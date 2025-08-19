import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/banner_widget.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      expandedHeight: 244,
      pinned: true,
      title: Text(
        'Event Details',
        style: Styels.textStyle24.copyWith(color: Colors.white),
      ),
      actions: [
        Padding(padding: EdgeInsets.only(right: 20), child: CustomIcon()),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Image.asset(
              width: double.infinity,
              height: double.infinity,
              AssetsData.eventPhoto,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 210,
              left: -50,
              right: -50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: BannerWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
