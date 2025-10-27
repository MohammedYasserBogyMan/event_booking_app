abstract class SignoutStates {}

class InitialSignoutStates extends SignoutStates {}

class SuccessSignOutState extends SignoutStates {}

class LoadingSignOutState extends SignoutStates {}

class FailureSignOutState extends SignoutStates {
  final String errMessage;
  FailureSignOutState({required this.errMessage});
}
