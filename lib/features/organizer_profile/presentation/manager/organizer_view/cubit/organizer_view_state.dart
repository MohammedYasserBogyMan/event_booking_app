part of 'organizer_view_cubit.dart';

@immutable
sealed class OrganizerProfileState {}

final class OrganizerViewInitial extends OrganizerProfileState {}

final class OrganizerProfileLoading extends OrganizerProfileState {}

final class OrganizerProfileSuccess extends OrganizerProfileState {
  final UserModel user;
  OrganizerProfileSuccess(this.user);
}

final class OrganizerProfileFailure extends OrganizerProfileState {
  final String message;
  OrganizerProfileFailure(this.message);
}
