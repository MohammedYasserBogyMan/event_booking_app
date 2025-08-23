part of 'current_user_cubit.dart';

@immutable
sealed class CurrentUserState {}

final class CurrentUserInitial extends CurrentUserState {}

final class CurrentUserLoading extends CurrentUserState {}

final class CurrentUserSuccess extends CurrentUserState {
  final UserModel user;
  CurrentUserSuccess(this.user);
}

final class CurrentUserFailure extends CurrentUserState {
  final String message;
  CurrentUserFailure(this.message);
}
