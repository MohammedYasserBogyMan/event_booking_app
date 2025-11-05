import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/google_signin_cubit/google_signin_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit(this.authRepo, this.userRepo)
      : super(InitialGoogleSignInState());

  final AuthRepo authRepo;
  final UserRepo userRepo;

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    emit(LoadingGoogleSignInState());

    var result = await authRepo.signInWithGoogle();

    await result.fold(
      (failure) async {
        emit(FailureGoogleSignInState(errMessage: failure.errMessage));
      },
      (_) async {
        // Get current user ID
        final userIdResult = await authRepo.getCurrentUserId();

        await userIdResult.fold(
          (failure) async {
            emit(FailureGoogleSignInState(errMessage: failure.errMessage));
          },
          (uid) async {
            // Check if user exists in Firestore
            final userResult = await userRepo.getUserByUid(uid);

            await userResult.fold(
              (failure) async {
                // User doesn't exist - create default profile from Google data
                final firebaseUser = FirebaseAuth.instance.currentUser;

                if (firebaseUser != null) {
                  // Extract first and last name from display name
                  String firstName = '';
                  String lastName = '';

                  if (firebaseUser.displayName != null &&
                      firebaseUser.displayName!.isNotEmpty) {
                    final nameParts = firebaseUser.displayName!.split(' ');
                    firstName = nameParts.isNotEmpty ? nameParts[0] : '';
                    lastName = nameParts.length > 1 ? nameParts[1] : '';
                  }

                  // Create UserModel with Google data
                  final newUser = UserModel(
                    uid: uid,
                    firstName: firstName,
                    lastName: lastName,
                    email: firebaseUser.email ?? '',
                    photoUrl: firebaseUser.photoURL ?? '',
                    location: '',
                    about: '',
                    followersCount: 0,
                    followingCount: 0,
                  );

                  // Create user profile in Firestore
                  final createResult = await userRepo.createUserProfile(newUser);

                  createResult.fold(
                    (createFailure) {
                      emit(FailureGoogleSignInState(
                        errMessage: createFailure.errMessage,
                      ));
                    },
                    (_) {
                      // New user created - redirect to verification/profile
                      emit(NewUserGoogleSignInState(userModel: newUser));
                    },
                  );
                } else {
                  emit(FailureGoogleSignInState(
                    errMessage: "Unable to get user data",
                  ));
                }
              },
              (existingUser) async {
                // User exists - direct login
                emit(SuccessGoogleSignInState());
              },
            );
          },
        );
      },
    );
  }
}
