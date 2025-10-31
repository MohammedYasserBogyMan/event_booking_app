import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/features/notification/data/models/app_notification.dart';

/// Helper class for creating notifications
class NotificationHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create a follow notification
  static Future<void> createFollowNotification({
    required String followingId, // User being followed
    required String followerId, // User who followed
    required String followerName,
    required String followerImage,
  }) async {
    try {
      final notification = AppNotification(
        id: '', // Will be set by Firestore
        userId: followingId,
        fromUserId: followerId,
        fromUserName: followerName,
        fromUserImage: followerImage,
        title: 'New Follower',
        message: '$followerName started following you',
        type: NotificationType.follow,
        createdAt: DateTime.now(),
        isRead: false,
        data: {'followerId': followerId},
      );

      await _firestore.collection('notifications').add(notification.toMap());
    } catch (e) {
      // Silently fail - don't break the follow action
      print('Failed to create follow notification: $e');
    }
  }

  /// Create a message notification
  static Future<void> createMessageNotification({
    required String receiverId,
    required String senderId,
    required String senderName,
    required String senderImage,
    required String messagePreview,
    required String conversationId,
  }) async {
    try {
      final notification = AppNotification(
        id: '',
        userId: receiverId,
        fromUserId: senderId,
        fromUserName: senderName,
        fromUserImage: senderImage,
        title: 'New Message',
        message: '$senderName sent you a message: $messagePreview',
        type: NotificationType.message,
        createdAt: DateTime.now(),
        isRead: false,
        data: {
          'conversationId': conversationId,
          'senderId': senderId,
        },
      );

      await _firestore.collection('notifications').add(notification.toMap());
    } catch (e) {
      print('Failed to create message notification: $e');
    }
  }

  /// Create a booking notification (for event organizer)
  static Future<void> createBookingNotification({
    required String organizerId,
    required String bookerId,
    required String bookerName,
    required String bookerImage,
    required String eventTitle,
    required String eventId,
  }) async {
    try {
      final notification = AppNotification(
        id: '',
        userId: organizerId,
        fromUserId: bookerId,
        fromUserName: bookerName,
        fromUserImage: bookerImage,
        title: 'New Booking',
        message: '$bookerName booked your event: $eventTitle',
        type: NotificationType.booking,
        createdAt: DateTime.now(),
        isRead: false,
        data: {
          'eventId': eventId,
          'bookerId': bookerId,
        },
      );

      await _firestore.collection('notifications').add(notification.toMap());
    } catch (e) {
      print('Failed to create booking notification: $e');
    }
  }

  /// Create an event update notification
  static Future<void> createEventUpdateNotification({
    required List<String> attendeeIds,
    required String organizerId,
    required String organizerName,
    required String organizerImage,
    required String eventTitle,
    required String eventId,
    required String updateMessage,
  }) async {
    try {
      for (String attendeeId in attendeeIds) {
        if (attendeeId == organizerId) continue; // Skip organizer

        final notification = AppNotification(
          id: '',
          userId: attendeeId,
          fromUserId: organizerId,
          fromUserName: organizerName,
          fromUserImage: organizerImage,
          title: 'Event Update',
          message: 'Update for $eventTitle: $updateMessage',
          type: NotificationType.eventUpdate,
          createdAt: DateTime.now(),
          isRead: false,
          data: {
            'eventId': eventId,
            'organizerId': organizerId,
          },
        );

        await _firestore.collection('notifications').add(notification.toMap());
      }
    } catch (e) {
      print('Failed to create event update notifications: $e');
    }
  }
}
