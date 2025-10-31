part of 'notification_cubit.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<AppNotification> notifications;
  final int unreadCount;

  NotificationLoaded({
    required this.notifications,
    required this.unreadCount,
  });
}

class NotificationFailure extends NotificationState {
  final String message;

  NotificationFailure({required this.message});
}
