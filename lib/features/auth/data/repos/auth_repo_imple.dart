import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/utils/errors.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImple implements AuthRepo {
  final FirebaseAuth auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthRepoImple(this.auth);
  // login implementaion
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

  // register implementation
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

  // resetPassword implementation
  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseAuthFailure(errMessage: error.code));
    }
  }
  // getUserId
  @override
  Future<Either<Failure, String>> getCurrentUserId() async {
    try {
      final userId = auth.currentUser!.uid;
      return Right(userId);
    } catch (e) {
      return Left(FirebaseAuthFailure(errMessage: "No authenticated user"));
    }
  }

  // signOut implementaion
  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await auth.signOut();
      return Right(null);
    } on Exception catch (error) {
      return Left(FirebaseAuthFailure(errMessage: error.toString()));
    }
  }

  // Email Verification implementation
  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      User? user = auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return Right(null);
      } else if (user == null) {
        return Left(FirebaseAuthFailure(errMessage: "No user logged in"));
      } else {
        return Left(FirebaseAuthFailure(errMessage: "Email already verified"));
      }
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseAuthFailure(errMessage: error.message ?? error.code));
    }
  }

  @override
  Future<Either<Failure, bool>> checkEmailVerified() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.reload();
        user = auth.currentUser;
        return Right(user?.emailVerified ?? false);
      } else {
        return Left(FirebaseAuthFailure(errMessage: "No user logged in"));
      }
    } catch (error) {
      return Left(FirebaseAuthFailure(errMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> reloadUser() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.reload();
        return Right(null);
      } else {
        return Left(FirebaseAuthFailure(errMessage: "No user logged in"));
      }
    } catch (error) {
      return Left(FirebaseAuthFailure(errMessage: error.toString()));
    }
  }

  // Google Sign-In implementation
  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return Left(FirebaseAuthFailure(errMessage: "Google sign-in canceled"));
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      await auth.signInWithCredential(credential);

      return Right(null);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseAuthFailure(
        errMessage: error.message ?? "Google sign-in failed",
      ));
    } catch (error) {
      return Left(FirebaseAuthFailure(
        errMessage: "An error occurred during Google sign-in: ${error.toString()}",
      ));
    }
  }
}
