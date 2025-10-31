import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/app_notification.dart';
import '../../../data/repositories/notification_repo.dart';

part 'notification_state.dart';

// Note: AppNotification is imported from app_notification.dart

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo notificationRepo;
  StreamSubscription? _notificationsSubscription;

  NotificationCubit({required this.notificationRepo})
      : super(NotificationInitial());

  /// Load notifications for a user
  Future<void> loadNotifications({required String userId}) async {
    emit(NotificationLoading());

    final notificationsResult =
        await notificationRepo.getUserNotifications(userId: userId);
    final unreadCountResult =
        await notificationRepo.getUnreadCount(userId: userId);

    notificationsResult.fold(
      (failure) => emit(NotificationFailure(message: failure.message)),
      (notifications) {
        final unreadCount = unreadCountResult.fold(
          (failure) => 0,
          (count) => count,
        );

        emit(NotificationLoaded(
          notifications: notifications,
          unreadCount: unreadCount,
        ));
      },
    );
  }

  /// Watch notifications stream (real-time updates)
  void watchNotifications({required String userId}) {
    _notificationsSubscription?.cancel();

    _notificationsSubscription = notificationRepo
        .watchUserNotifications(userId: userId)
        .listen((result) {
      result.fold(
        (failure) => emit(NotificationFailure(message: failure.message)),
        (notifications) {
          // Calculate unread count directly from notifications list
          final unreadCount = notifications.where((n) => !n.isRead).length;

          emit(NotificationLoaded(
            notifications: notifications,
            unreadCount: unreadCount,
          ));
        },
      );
    });
  }

  /// Mark notification as read
  Future<void> markAsRead({
    required String notificationId,
    required String userId,
  }) async {
    await notificationRepo.markAsRead(notificationId: notificationId);
    // Reload to update UI
    loadNotifications(userId: userId);
  }

  /// Mark all as read
  Future<void> markAllAsRead({required String userId}) async {
    await notificationRepo.markAllAsRead(userId: userId);
    // Reload to update UI
    loadNotifications(userId: userId);
  }

  /// Delete notification
  Future<void> deleteNotification({
    required String notificationId,
    required String userId,
  }) async {
    await notificationRepo.deleteNotification(notificationId: notificationId);
    // Reload to update UI
    loadNotifications(userId: userId);
  }

  /// Create a notification (helper method)
  Future<void> createNotification({
    required AppNotification notification,
  }) async {
    await notificationRepo.createNotification(notification: notification);
  }

  @override
  Future<void> close() {
    _notificationsSubscription?.cancel();
    return super.close();
  }
}
