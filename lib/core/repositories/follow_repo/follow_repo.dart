import 'package:dartz/dartz.dart';
import '../../failure/errors.dart';

/// Abstract repository for managing follow relationships
abstract class FollowRepo {
  /// Follow a user
  Future<Either<Failure, void>> followUser({
    required String followerId,
    required String followingId,
  });

  /// Unfollow a user
  Future<Either<Failure, void>> unfollowUser({
    required String followerId,
    required String followingId,
  });

  /// Check if user is following another user
  Future<Either<Failure, bool>> isFollowing({
    required String followerId,
    required String followingId,
  });

  /// Get list of users that a user is following
  Future<Either<Failure, List<String>>> getFollowing({
    required String userId,
  });

  /// Get list of users that follow a user (followers)
  Future<Either<Failure, List<String>>> getFollowers({
    required String userId,
  });

  /// Get follower count for a user
  Future<Either<Failure, int>> getFollowerCount({
    required String userId,
  });

  /// Get following count for a user
  Future<Either<Failure, int>> getFollowingCount({
    required String userId,
  });
}
