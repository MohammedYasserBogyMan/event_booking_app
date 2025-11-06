import 'package:event_booking_app/core/models/user_model.dart';

// Register States
abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class SuccessRegisterState extends RegisterStates {
  final UserModel userModel;
  SuccessRegisterState({required this.userModel});
}

class FailureRegisterState extends RegisterStates {
  final String errMessage;
  FailureRegisterState({required this.errMessage});
}

class LoadingRegisterState extends RegisterStates {}