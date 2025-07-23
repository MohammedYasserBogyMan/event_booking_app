import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/features/notification/data/models/app_notification.dart';
import 'package:event_booking_app/features/notification/presentation/view/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  NotificationViewBody({super.key});
  final List<AppNotification> notifications = [
    AppNotification(
      userImage: AssetsData.notificationImage,
      name: "Abdallah Mohamed",
      date: "12:30",
      userMessageNotification: "Mohammed Started following you",
      type: NotificationType.followRequest,
    ),
    AppNotification(
      userImage: AssetsData.notificationImage,
      name: "Abdallah Mohamed",
      date: "5:30",
      userMessageNotification: "Mohammed Started following you",
      type: NotificationType.message,
    ),
    AppNotification(
      userImage: AssetsData.notificationImage,
      name: "Abdallah Mohamed",
      date: "8:30",
      userMessageNotification: "Mohammed Started following you",
      type: NotificationType.message,
    ),
    AppNotification(
      userImage: AssetsData.notificationImage,
      name: "Abdallah Mohamed",
      date: "00:30",
      userMessageNotification: "Mohammed Started following you",
      type: NotificationType.message,
    ),
    AppNotification(
      userImage: AssetsData.notificationImage,
      name: "Abdallah Mohamed",
      date: "3:30",
      userMessageNotification: "Mohammed Started following you",
      type: NotificationType.message,
    ),
    AppNotification(
      userImage: AssetsData.notificationImage,
      name: "Abdallah Mohamed",
      date: "9:30",
      userMessageNotification: "Mohammed Started following you",
      type: NotificationType.followRequest,
    ),
    AppNotification(
      userImage: AssetsData.notificationImage,
      name: "Abdallah Mohamed",
      date: "12:10",
      userMessageNotification: "Mohammed Started following you",
      type: NotificationType.followRequest,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NotificationWidget(notificationModel: notifications[0]),
          NotificationWidget(notificationModel: notifications[1]),
          NotificationWidget(notificationModel: notifications[2]),
          NotificationWidget(notificationModel: notifications[3]),
          NotificationWidget(notificationModel: notifications[4]),
          NotificationWidget(notificationModel: notifications[5]),
          NotificationWidget(notificationModel: notifications[6]),
          NotificationWidget(notificationModel: notifications[6]),
          NotificationWidget(notificationModel: notifications[6]),
        ],
      ),
    );
  }
}
