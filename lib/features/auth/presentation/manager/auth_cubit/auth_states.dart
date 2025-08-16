abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class SuccessLoginState extends AuthStates {}

class FailureLoginState extends AuthStates {
  final String errMessage;
  FailureLoginState({required this.errMessage});
}

class LoadingLoginState extends AuthStates {}

class SuccessRegisterState extends AuthStates {}

class FailureRegisterState extends AuthStates {
  final String errorMessage;
  FailureRegisterState({required this.errorMessage});
}

class LoadingRegisterState extends AuthStates {}
