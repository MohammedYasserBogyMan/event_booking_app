part of 'follow_cubit.dart';

abstract class FollowState {}

class FollowInitial extends FollowState {}

class FollowLoading extends FollowState {}

class FollowSuccess extends FollowState {
  final bool isFollowing;

  FollowSuccess({required this.isFollowing});
}

class FollowFailure extends FollowState {
  final String message;

  FollowFailure({required this.message});
}

// States for getting followers/following lists
class FollowListLoading extends FollowState {}

class FollowListSuccess extends FollowState {
  final List<String> userIds;
  final int count;

  FollowListSuccess({required this.userIds, required this.count});
}

class FollowListFailure extends FollowState {
  final String message;

  FollowListFailure({required this.message});
}
