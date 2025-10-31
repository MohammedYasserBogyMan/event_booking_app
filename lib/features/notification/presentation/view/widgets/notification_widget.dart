import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/notification/data/models/app_notification.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.notificationModel,
    this.onTap,
  });

  final AppNotification notificationModel;
  final VoidCallback? onTap;

  IconData _getIconForType(NotificationType type) {
    switch (type) {
      case NotificationType.follow:
        return Icons.person_add;
      case NotificationType.message:
        return Icons.message;
      case NotificationType.booking:
        return Icons.event_seat;
      case NotificationType.eventUpdate:
        return Icons.event_note;
      case NotificationType.info:
        return Icons.info;
    }
  }

  Color _getColorForType(NotificationType type) {
    switch (type) {
      case NotificationType.follow:
        return Colors.blue;
      case NotificationType.message:
        return Colors.green;
      case NotificationType.booking:
        return Colors.orange;
      case NotificationType.eventUpdate:
        return Colors.purple;
      case NotificationType.info:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color:
            notificationModel.isRead ? Colors.white : Colors.blue.withAlpha(13),
        child: ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage:
                    notificationModel.fromUserImage.isNotEmpty
                        ? CachedNetworkImageProvider(
                          notificationModel.fromUserImage,
                        )
                        : null,
                child:
                    notificationModel.fromUserImage.isEmpty
                        ? const Icon(Icons.person)
                        : null,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: _getColorForType(notificationModel.type),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: Icon(
                    _getIconForType(notificationModel.type),
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  notificationModel.title,
                  style: Styels.textStyleRegular14.copyWith(
                    fontWeight:
                        notificationModel.isRead
                            ? FontWeight.normal
                            : FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (!notificationModel.isRead)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                notificationModel.message,
                style: Styels.textStyleRegular12.copyWith(
                  color: Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          trailing: Text(
            formatTimeAgo(notificationModel.createdAt),
            style: Styels.textStyleRegular12.copyWith(color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
