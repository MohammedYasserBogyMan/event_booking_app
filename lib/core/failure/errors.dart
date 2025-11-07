class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required String errMessage}) : super(message: errMessage);
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required String errMessage}) : super(message: errMessage);
}
