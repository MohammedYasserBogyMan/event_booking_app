// Register States
abstract class RegisterStates {}
class InitialRegisterState extends RegisterStates{}
class SuccessRegisterState extends RegisterStates {}

class FailureRegisterState extends RegisterStates {
  final String errMessage;
  FailureRegisterState({required this.errMessage});
}

class LoadingRegisterState extends RegisterStates {}