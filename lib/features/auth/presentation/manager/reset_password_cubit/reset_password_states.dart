abstract class ResetPasswordStates {}

class InitialResetPasswordState extends ResetPasswordStates {}

class LoadingResetState extends ResetPasswordStates {}

class SuccessResetState extends ResetPasswordStates {}

class FailureResetState extends ResetPasswordStates {
  final String errMessage;
  FailureResetState({required this.errMessage});
}
