
import 'package:event_booking_app/core/models/user_model.dart';

abstract class CurrentUserState {}

class CurrentUserInitial extends CurrentUserState {}

class CurrentUserLoading extends CurrentUserState {}

class CurrentUserSuccess extends CurrentUserState {
  final UserModel user;
  CurrentUserSuccess(this.user);
}

class CurrentUserFailure extends CurrentUserState {
  final String message;
  CurrentUserFailure(this.message);
}
