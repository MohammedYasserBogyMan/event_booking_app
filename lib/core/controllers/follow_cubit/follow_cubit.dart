import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/follow_repo/follow_repo.dart';

part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  final FollowRepo followRepo;

  FollowCubit({required this.followRepo}) : super(FollowInitial());

  /// Follow a user
  Future<void> followUser({
    required String followerId,
    required String followingId,
  }) async {
    emit(FollowLoading());

    final result = await followRepo.followUser(
      followerId: followerId,
      followingId: followingId,
    );

    result.fold(
      (failure) => emit(FollowFailure(message: failure.message)),
      (_) => emit(FollowSuccess(isFollowing: true)),
    );
  }

  /// Unfollow a user
  Future<void> unfollowUser({
    required String followerId,
    required String followingId,
  }) async {
    emit(FollowLoading());

    final result = await followRepo.unfollowUser(
      followerId: followerId,
      followingId: followingId,
    );

    result.fold(
      (failure) => emit(FollowFailure(message: failure.message)),
      (_) => emit(FollowSuccess(isFollowing: false)),
    );
  }

  /// Check if user is following another user
  Future<void> checkFollowStatus({
    required String followerId,
    required String followingId,
  }) async {
    emit(FollowLoading());

    final result = await followRepo.isFollowing(
      followerId: followerId,
      followingId: followingId,
    );

    result.fold(
      (failure) => emit(FollowFailure(message: failure.message)),
      (isFollowing) => emit(FollowSuccess(isFollowing: isFollowing)),
    );
  }

  /// Get followers list
  Future<void> getFollowers({required String userId}) async {
    emit(FollowListLoading());

    final result = await followRepo.getFollowers(userId: userId);

    result.fold(
      (failure) => emit(FollowListFailure(message: failure.message)),
      (followers) => emit(FollowListSuccess(
        userIds: followers,
        count: followers.length,
      )),
    );
  }

  /// Get following list
  Future<void> getFollowing({required String userId}) async {
    emit(FollowListLoading());

    final result = await followRepo.getFollowing(userId: userId);

    result.fold(
      (failure) => emit(FollowListFailure(message: failure.message)),
      (following) => emit(FollowListSuccess(
        userIds: following,
        count: following.length,
      )),
    );
  }

  /// Get follower count
  Future<int> getFollowerCount({required String userId}) async {
    final result = await followRepo.getFollowerCount(userId: userId);
    return result.fold((failure) => 0, (count) => count);
  }

  /// Get following count
  Future<int> getFollowingCount({required String userId}) async {
    final result = await followRepo.getFollowingCount(userId: userId);
    return result.fold((failure) => 0, (count) => count);
  }
}
