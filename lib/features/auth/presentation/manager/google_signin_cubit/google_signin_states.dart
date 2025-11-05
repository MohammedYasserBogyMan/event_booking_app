import 'package:event_booking_app/core/models/user_model.dart';

abstract class GoogleSignInState {}

class InitialGoogleSignInState extends GoogleSignInState {}

class LoadingGoogleSignInState extends GoogleSignInState {}

// User exists in Firestore
class SuccessGoogleSignInState extends GoogleSignInState {}

// New user - needs to complete profile
class NewUserGoogleSignInState extends GoogleSignInState {
  final UserModel userModel;
  NewUserGoogleSignInState({required this.userModel});
}

class FailureGoogleSignInState extends GoogleSignInState {
  final String errMessage;
  FailureGoogleSignInState({required this.errMessage});
}
