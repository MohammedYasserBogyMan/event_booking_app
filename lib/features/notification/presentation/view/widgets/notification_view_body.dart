import 'package:event_booking_app/features/notification/presentation/view/widgets/notification_action_button.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationActionButton(isFilled: true, text: "Accept"),
        NotificationActionButton(isFilled: false, text: "Reject"),
      ],
    );
  }
}
