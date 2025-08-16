abstract class AuthStates {}

class AuthInitial extends AuthStates {}


// Login States
class SuccessLoginState extends AuthStates {}

class FailureLoginState extends AuthStates {
  final String errMessage;
  FailureLoginState({required this.errMessage});
}

class LoadingLoginState extends AuthStates {}


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
