import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/failure/errors.dart';
import '../models/app_notification.dart';
import 'notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final FirebaseFirestore firestore;

  NotificationRepoImpl({required this.firestore});

  CollectionReference get _notificationsCollection =>
      firestore.collection('notifications');

  @override
  Future<Either<Failure, void>> createNotification({
    required AppNotification notification,
  }) async {
    try {
      await _notificationsCollection.add(notification.toMap());
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to create notification: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<AppNotification>>> getUserNotifications({
    required String userId,
    int? limit,
  }) async {
    try {
      Query query = _notificationsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true);

      if (limit != null) {
        query = query.limit(limit);
      }

      final snapshot = await query.get();
      final notifications = snapshot.docs
          .map((doc) => AppNotification.fromFirestore(doc))
          .toList();

      return Right(notifications);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to get notifications: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount({
    required String userId,
  }) async {
    try {
      final snapshot = await _notificationsCollection
          .where('userId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .get();

      return Right(snapshot.docs.length);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to get unread count: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead({
    required String notificationId,
  }) async {
    try {
      await _notificationsCollection.doc(notificationId).update({
        'isRead': true,
      });
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to mark as read: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead({
    required String userId,
  }) async {
    try {
      final snapshot = await _notificationsCollection
          .where('userId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .get();

      final batch = firestore.batch();
      for (var doc in snapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }

      await batch.commit();
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to mark all as read: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotification({
    required String notificationId,
  }) async {
    try {
      await _notificationsCollection.doc(notificationId).delete();
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(message: 'Failed to delete notification: ${e.toString()}'),
      );
    }
  }

  @override
  Stream<Either<Failure, List<AppNotification>>> watchUserNotifications({
    required String userId,
  }) {
    try {
      return _notificationsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(50) // Limit to latest 50 notifications
          .snapshots()
          .map((snapshot) {
        final notifications = snapshot.docs
            .map((doc) => AppNotification.fromFirestore(doc))
            .toList();
        return Right<Failure, List<AppNotification>>(notifications);
      }).handleError((error) {
        return Left<Failure, List<AppNotification>>(
          Failure(message: 'Failed to watch notifications: ${error.toString()}'),
        );
      });
    } catch (e) {
      return Stream.value(
        Left(Failure(message: 'Failed to watch notifications: ${e.toString()}')),
      );
    }
  }
}
