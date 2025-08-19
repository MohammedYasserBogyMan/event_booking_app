abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.errMessage});
}
