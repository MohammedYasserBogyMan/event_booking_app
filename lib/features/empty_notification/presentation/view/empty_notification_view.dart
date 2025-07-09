import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/empty_notification/presentation/view/widgets/empty_notification_view_body.dart';
import 'package:flutter/material.dart';

class EmptyNotificationView extends StatelessWidget {
  const EmptyNotificationView({super.key});
  static String id = "EmptyNotification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        title: Text("Notification", style: Styels.textStyle24),
        backgroundColor: Colors.white,
      ),
      body: EmptyNotificationViewBody(),
    );
  }
}
