import 'package:dartz/dartz.dart';
import '../../../../core/failure/errors.dart';
import '../models/app_notification.dart';

/// Abstract repository for managing in-app notifications
abstract class NotificationRepo {
  /// Create a new notification
  Future<Either<Failure, void>> createNotification({
    required AppNotification notification,
  });

  /// Get all notifications for a user
  Future<Either<Failure, List<AppNotification>>> getUserNotifications({
    required String userId,
    int? limit,
  });

  /// Get unread notifications count
  Future<Either<Failure, int>> getUnreadCount({
    required String userId,
  });

  /// Mark notification as read
  Future<Either<Failure, void>> markAsRead({
    required String notificationId,
  });

  /// Mark all notifications as read
  Future<Either<Failure, void>> markAllAsRead({
    required String userId,
  });

  /// Delete a notification
  Future<Either<Failure, void>> deleteNotification({
    required String notificationId,
  });

  /// Listen to notifications stream (real-time)
  Stream<Either<Failure, List<AppNotification>>> watchUserNotifications({
    required String userId,
  });
}
