import 'package:event_booking_app/core/models/user_model.dart';

abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class EmailNotVerifiedState extends LoginStates {
  final UserModel userModel;
  EmailNotVerifiedState({required this.userModel});
}

class FailureLoginState extends LoginStates {
  final String errMessage;
  FailureLoginState({required this.errMessage});
}

class LoadingLoginState extends LoginStates {}
