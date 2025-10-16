import 'dart:ui';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditEventOverlayButton extends StatelessWidget {
  const EditEventOverlayButton({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Container(
            width: 400,
            height: 120,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromARGB(128, 255, 254, 254),
            ),
            child: SizedBox(
              height: 70,
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.push('/edit-event', extra: event);
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  'Edit Event',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
