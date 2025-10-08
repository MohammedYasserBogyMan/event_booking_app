import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/notification/data/models/app_notification.dart';
import 'package:event_booking_app/features/notification/presentation/view/widgets/notification_action_button.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notificationModel});
  final AppNotification notificationModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: Image(image: AssetImage(notificationModel.userImage)),
      title: Row(
        children: [
          Text(
            notificationModel.name,
            style: Styels.textStyleRegular14.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationModel.userMessageNotification,
            style: Styels.textStyleRegular14,
          ),
          SizedBox(height: 20),
          if (notificationModel.type == NotificationType.followRequest)
            Row(
              children: [
                Expanded(
                  child: NotificationActionButton(
                    text: "Accept",
                    isFilled: true,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: NotificationActionButton(
                    text: "Reject",
                    isFilled: false,
                  ),
                ),
              ],
            ),
        ],
      ),
      trailing: Text(notificationModel.date, style: Styels.textStyleRegular12),
    );
  }
}
