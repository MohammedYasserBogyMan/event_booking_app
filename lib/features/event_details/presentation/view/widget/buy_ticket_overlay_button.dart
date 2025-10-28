import 'dart:ui';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/booking/presentation/views/payment_screen.dart';
import 'package:flutter/material.dart';

class BuyTicketOverlayButton extends StatelessWidget {
  const BuyTicketOverlayButton({
    super.key,
    required this.price,
    required this.event,
    this.isBooked = false,
    this.isFull = false,
  });

  final int price;
  final EventModel event;
  final bool isBooked;
  final bool isFull;

  @override
  Widget build(BuildContext context) {
    String buttonText;
    Color? buttonColor;
    VoidCallback? onPressed;

    if (isBooked) {
      buttonText = "Already Booked";
      buttonColor = Colors.grey;
      onPressed = null;
    } else if (isFull) {
      buttonText = "Event Full";
      buttonColor = Colors.red;
      onPressed = null;
    } else {
      buttonText = "Buy Ticket \$$price";
      buttonColor = null;
      onPressed = () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentScreen(event: event),
          ),
        );
      };
    }

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
              child: CustomButton(
                text: buttonText,
                onPressed: onPressed,
                backgroundColor: buttonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
