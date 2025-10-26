abstract class AuthStates {}

class AuthInitial extends AuthStates {}


// Register States
class SuccessRegisterState extends AuthStates {}

class FailureRegisterState extends AuthStates {
  final String errMessage;
  FailureRegisterState({required this.errMessage});
}

class LoadingRegisterState extends AuthStates {}

// Reset States
class LoadingResetState extends AuthStates {}

class SuccessResetState extends AuthStates {}

class FailureResetState extends AuthStates {
  final String errMessage;
  FailureResetState({required this.errMessage});
}

// sign out
class SuccessSignOutState extends AuthStates {}

class LoadingSignOutState extends AuthStates {}

class FailureSignOutState extends AuthStates {
  final String errMessage;
  FailureSignOutState({required this.errMessage});
}


// verification (not implemented!!!)
class SuccessVerificationState extends AuthStates {}

class LoadingVerificationState extends AuthStates {}

class FailureVerificationState extends AuthStates {
  final String errMessage;
  FailureVerificationState({required this.errMessage});
}
