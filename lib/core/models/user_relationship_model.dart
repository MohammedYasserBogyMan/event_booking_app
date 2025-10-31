import 'package:cloud_firestore/cloud_firestore.dart';

/// Model representing a follow relationship between users
class UserRelationshipModel {
  final String followerId; // User who is following
  final String followingId; // User being followed
  final DateTime followedAt;

  UserRelationshipModel({
    required this.followerId,
    required this.followingId,
    required this.followedAt,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'followerId': followerId,
      'followingId': followingId,
      'followedAt': Timestamp.fromDate(followedAt),
    };
  }

  // Create from Firestore document
  factory UserRelationshipModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserRelationshipModel(
      followerId: data['followerId'] ?? '',
      followingId: data['followingId'] ?? '',
      followedAt: (data['followedAt'] as Timestamp).toDate(),
    );
  }

  // Copy with method for immutability
  UserRelationshipModel copyWith({
    String? followerId,
    String? followingId,
    DateTime? followedAt,
  }) {
    return UserRelationshipModel(
      followerId: followerId ?? this.followerId,
      followingId: followingId ?? this.followingId,
      followedAt: followedAt ?? this.followedAt,
    );
  }
}
