abstract class GoogleSignInState {}

class InitialGoogleSignInState extends GoogleSignInState {}

class LoadingGoogleSignInState extends GoogleSignInState {}

class SuccessGoogleSignInState extends GoogleSignInState {}

class FailureGoogleSignInState extends GoogleSignInState {
  final String errMessage;
  FailureGoogleSignInState({required this.errMessage});
}
