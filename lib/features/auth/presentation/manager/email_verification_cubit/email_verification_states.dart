abstract class EmailVerificationState {}

class InitialEmailVerificationState extends EmailVerificationState {}

class LoadingEmailVerificationState extends EmailVerificationState {}

class SuccessEmailVerificationState extends EmailVerificationState {}

class FailureEmailVerificationState extends EmailVerificationState {
  final String errMessage;
  FailureEmailVerificationState({required this.errMessage});
}

class EmailNotVerifiedState extends EmailVerificationState {}

class ResendEmailSuccessState extends EmailVerificationState {}

class ResendEmailFailureState extends EmailVerificationState {
  final String errMessage;
  ResendEmailFailureState({required this.errMessage});
}
