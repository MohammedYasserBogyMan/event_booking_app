import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:flutter/material.dart';

class CustomEventImage extends StatelessWidget {
  const CustomEventImage({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => CircularProgressIndicator(),
        imageUrl: eventModel.imageUrl,
        placeholder:
            (context, url) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
