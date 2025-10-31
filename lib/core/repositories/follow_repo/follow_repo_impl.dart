import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../failure/errors.dart';
import '../../models/user_relationship_model.dart';
import '../../utils/notification_helper.dart';
import 'follow_repo.dart';

class FollowRepoImpl implements FollowRepo {
  final FirebaseFirestore firestore;

  FollowRepoImpl({required this.firestore});

  /// Collection references
  CollectionReference get _followersCollection => firestore.collection('followers');
  CollectionReference get _followingCollection => firestore.collection('following');
  CollectionReference get _usersCollection => firestore.collection('users');

  @override
  Future<Either<Failure, void>> followUser({
    required String followerId,
    required String followingId,
  }) async {
    try {
      // Validate that users are different
      if (followerId == followingId) {
        return Left(Failure(message: 'Cannot follow yourself'));
      }

      final batch = firestore.batch();
      final timestamp = DateTime.now();

      // Create relationship model
      final relationship = UserRelationshipModel(
        followerId: followerId,
        followingId: followingId,
        followedAt: timestamp,
      );

      // Add to followers collection: followers/{followingId}/userFollowers/{followerId}
      final followerDoc = _followersCollection
          .doc(followingId)
          .collection('userFollowers')
          .doc(followerId);
      batch.set(followerDoc, relationship.toMap());

      // Add to following collection: following/{followerId}/userFollowing/{followingId}
      final followingDoc = _followingCollection
          .doc(followerId)
          .collection('userFollowing')
          .doc(followingId);
      batch.set(followingDoc, relationship.toMap());

      // Update follower count for the user being followed
      final followingUserDoc = _usersCollection.doc(followingId);
      batch.update(followingUserDoc, {
        'followersCount': FieldValue.increment(1),
      });

      // Update following count for the user who is following
      final followerUserDoc = _usersCollection.doc(followerId);
      batch.update(followerUserDoc, {
        'followingCount': FieldValue.increment(1),
      });

      // Commit batch write
      await batch.commit();

      // Create notification for the followed user
      try {
        // Get follower's information
        final followerDoc = await _usersCollection.doc(followerId).get();
        if (followerDoc.exists) {
          final followerData = followerDoc.data() as Map<String, dynamic>;
          final firstName = followerData['firstName'] ?? '';
          final lastName = followerData['lastName'] ?? '';
          final followerName = '$firstName $lastName'.trim().isEmpty
              ? 'Someone'
              : '$firstName $lastName'.trim();
          final followerImage = followerData['photoUrl'] ?? '';

          // Create follow notification
          await NotificationHelper.createFollowNotification(
            followingId: followingId,
            followerId: followerId,
            followerName: followerName,
            followerImage: followerImage,
          );
        }
      } catch (e) {
        // Log error but don't fail the follow action
        print('Failed to create follow notification: ${e.toString()}');
      }

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to follow user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> unfollowUser({
    required String followerId,
    required String followingId,
  }) async {
    try {
      final batch = firestore.batch();

      // Remove from followers collection
      final followerDoc = _followersCollection
          .doc(followingId)
          .collection('userFollowers')
          .doc(followerId);
      batch.delete(followerDoc);

      // Remove from following collection
      final followingDoc = _followingCollection
          .doc(followerId)
          .collection('userFollowing')
          .doc(followingId);
      batch.delete(followingDoc);

      // Update follower count for the user being unfollowed
      final followingUserDoc = _usersCollection.doc(followingId);
      batch.update(followingUserDoc, {
        'followersCount': FieldValue.increment(-1),
      });

      // Update following count for the user who is unfollowing
      final followerUserDoc = _usersCollection.doc(followerId);
      batch.update(followerUserDoc, {
        'followingCount': FieldValue.increment(-1),
      });

      // Commit batch write
      await batch.commit();

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Failed to unfollow user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> isFollowing({
    required String followerId,
    required String followingId,
  }) async {
    try {
      final doc = await _followingCollection
          .doc(followerId)
          .collection('userFollowing')
          .doc(followingId)
          .get();

      return Right(doc.exists);
    } catch (e) {
      return Left(Failure(message: 'Failed to check follow status: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFollowing({
    required String userId,
  }) async {
    try {
      final snapshot = await _followingCollection
          .doc(userId)
          .collection('userFollowing')
          .get();

      final followingIds = snapshot.docs.map((doc) => doc.id).toList();
      return Right(followingIds);
    } catch (e) {
      return Left(Failure(message: 'Failed to get following list: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFollowers({
    required String userId,
  }) async {
    try {
      final snapshot = await _followersCollection
          .doc(userId)
          .collection('userFollowers')
          .get();

      final followerIds = snapshot.docs.map((doc) => doc.id).toList();
      return Right(followerIds);
    } catch (e) {
      return Left(Failure(message: 'Failed to get followers list: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> getFollowerCount({
    required String userId,
  }) async {
    try {
      final userDoc = await _usersCollection.doc(userId).get();

      if (!userDoc.exists) {
        return const Right(0);
      }

      final data = userDoc.data() as Map<String, dynamic>?;
      final count = data?['followersCount'] as int? ?? 0;

      return Right(count);
    } catch (e) {
      return Left(Failure(message: 'Failed to get follower count: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> getFollowingCount({
    required String userId,
  }) async {
    try {
      final userDoc = await _usersCollection.doc(userId).get();

      if (!userDoc.exists) {
        return const Right(0);
      }

      final data = userDoc.data() as Map<String, dynamic>?;
      final count = data?['followingCount'] as int? ?? 0;

      return Right(count);
    } catch (e) {
      return Left(Failure(message: 'Failed to get following count: ${e.toString()}'));
    }
  }
}
