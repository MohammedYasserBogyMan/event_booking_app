import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/utils/errors.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImple implements AuthRepo {
  final FirebaseAuth auth;
  AuthRepoImple(this.auth);
  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return right(null);
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-credential") {
        return Left(
          FirebaseAuthFailure(
            errMessage: "Invalid credentials, please try again or SignUp",
          ),
        );
      } else if (error.code == "invalid-email") {
        return Left(FirebaseAuthFailure(errMessage: "This Email Is invalid"));
      } else {
        return Left(FirebaseAuthFailure(errMessage: error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        return Left(
          FirebaseAuthFailure(
            errMessage: "This Email Already In use, \nplease Sign In",
          ),
        );
      } else if (error.code == "weak-password") {
        return Left(FirebaseAuthFailure(errMessage: "This Password Is Weak"));
      } else if (error.code == "invalid-email") {
        return Left(FirebaseAuthFailure(errMessage: "This Email Is invalid"));
      } else {
        return Left(FirebaseAuthFailure(errMessage: "This Email Is invalid"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseAuthFailure(errMessage: error.code));
    }
  }
}
