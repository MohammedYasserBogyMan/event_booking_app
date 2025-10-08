import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/banner_widget.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.going, required this.imageUrl});
  final int going;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      floating: false,
      expandedHeight: 244,
      pinned: true,
      title: Text(
        'Event Details',
        style: Styels.textStyleMedium24.copyWith(color: Colors.white),
      ),
      actions: [
        Padding(padding: EdgeInsets.only(right: 20), child: CustomIcon()),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 210,
              left: -50,
              right: -50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: BannerWidget(going: going),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
