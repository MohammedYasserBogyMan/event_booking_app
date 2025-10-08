import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/notification/presentation/view/widgets/empty_notification_view_body.dart';
import 'package:flutter/material.dart';

class EmptyNotificationView extends StatelessWidget {
  const EmptyNotificationView({super.key});
  static String id = "EmptyNotification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: EmptyNotificationViewBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      title: Text("Notification", style: Styels.textStyleRegular24),
    );
  }
}
