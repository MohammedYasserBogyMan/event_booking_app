part of 'profile_view_cubit.dart';

@immutable
sealed class ProfileViewState {}

final class ProfileViewInitial extends ProfileViewState {}

final class ProfileViewLoading extends ProfileViewState {}

final class ProfileViewSuccess extends ProfileViewState {
  final UserModel user;
  ProfileViewSuccess(this.user);
}

final class ProfileViewFailure extends ProfileViewState {
  final String message;
  ProfileViewFailure(this.message);
}
