import 'dart:ui';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BuyTicketOverlayButton extends StatelessWidget {
  const BuyTicketOverlayButton({super.key, required this.eventModel});
  final EventModel eventModel;
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
            decoration: BoxDecoration(
              color: const Color.fromARGB(128, 255, 254, 254),
            ),
            child: SizedBox(
              height: 70,
              width: 300,
              child: CustomButton(text: "Buy Ticket \$120"),
            ),
          ),
        ),
      ),
    );
  }
}
