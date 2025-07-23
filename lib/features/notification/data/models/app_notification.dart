class AppNotification {
  final String userImage;
  final String name;
  final String userMessageNotification;
  final String date;
  final NotificationType type;
  AppNotification({
    required this.userImage,
    required this.name,
    required this.date,
    required this.userMessageNotification,
    required this.type
  });
}

enum NotificationType { followRequest, message }
