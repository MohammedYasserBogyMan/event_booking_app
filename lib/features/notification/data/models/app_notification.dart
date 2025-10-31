import 'package:cloud_firestore/cloud_firestore.dart';

class AppNotification {
  final String id;
  final String userId; // User who will receive the notification
  final String fromUserId; // User who triggered the notification
  final String fromUserName;
  final String fromUserImage;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime createdAt;
  final bool isRead;
  final Map<String, dynamic>? data; // Extra data (eventId, messageId, etc.)

  AppNotification({
    required this.id,
    required this.userId,
    required this.fromUserId,
    required this.fromUserName,
    required this.fromUserImage,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
    this.data,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fromUserId': fromUserId,
      'fromUserName': fromUserName,
      'fromUserImage': fromUserImage,
      'title': title,
      'message': message,
      'type': type.name,
      'createdAt': Timestamp.fromDate(createdAt),
      'isRead': isRead,
      'data': data,
    };
  }

  // Create from Firestore document
  factory AppNotification.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AppNotification(
      id: doc.id,
      userId: data['userId'] ?? '',
      fromUserId: data['fromUserId'] ?? '',
      fromUserName: data['fromUserName'] ?? '',
      fromUserImage: data['fromUserImage'] ?? '',
      title: data['title'] ?? '',
      message: data['message'] ?? '',
      type: NotificationType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => NotificationType.info,
      ),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      isRead: data['isRead'] ?? false,
      data: data['data'] as Map<String, dynamic>?,
    );
  }

  // Copy with method
  AppNotification copyWith({
    String? id,
    String? userId,
    String? fromUserId,
    String? fromUserName,
    String? fromUserImage,
    String? title,
    String? message,
    NotificationType? type,
    DateTime? createdAt,
    bool? isRead,
    Map<String, dynamic>? data,
  }) {
    return AppNotification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fromUserId: fromUserId ?? this.fromUserId,
      fromUserName: fromUserName ?? this.fromUserName,
      fromUserImage: fromUserImage ?? this.fromUserImage,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      data: data ?? this.data,
    );
  }
}

enum NotificationType {
  follow,        // Someone followed you
  message,       // New message received
  booking,       // Someone booked your event
  eventUpdate,   // Event you're attending was updated
  info,          // General information
}
