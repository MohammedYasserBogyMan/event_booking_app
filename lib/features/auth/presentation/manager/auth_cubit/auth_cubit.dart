import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoadingLoginState());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user;
      emit(SuccessLoginState());
    } on FirebaseAuthException catch (firebaseException) {
      if (firebaseException.code == "invalid-credential") {
        emit(
          FailureLoginState(
            errorMessage: "Invalid credentials, please try again or SignUp",
          ),
        );
      } else if (firebaseException.code == "invalid-email") {
        emit(FailureLoginState(errorMessage: "This Email Is invalid"));
      }
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(LoadingRegisterState());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      emit(SuccessRegisterState());
    } on FirebaseAuthException catch (firebaseException) {
      if (firebaseException.code == "email-already-in-use") {
        emit(
          FailureRegisterState(
            errorMessage: "This Email Already In use, \nplease Sign In",
          ),
        );
      } else if (firebaseException.code == "weak-password") {
        emit(FailureRegisterState(errorMessage: "This Password Is Weak"));
      } else if (firebaseException.code == "invalid-email") {
        emit(FailureRegisterState(errorMessage: "This Email Is invalid"));
      }
    }
  }

  // Future<void> resetpassword() {}
  // Future<void> verification() {}
}
