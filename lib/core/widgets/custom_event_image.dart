import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/widgets/optimized_cached_image.dart';
import 'package:flutter/material.dart';

class CustomEventImage extends StatelessWidget {
  const CustomEventImage({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return OptimizedCachedImage(
      imageUrl: eventModel.imageUrl,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
