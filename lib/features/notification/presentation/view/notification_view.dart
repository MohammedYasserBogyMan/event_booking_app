import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/notification/presentation/view/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: NotificationViewBody());
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      title: const Text("Notification", style: Styels.textStyle24),
    );
  }
}
