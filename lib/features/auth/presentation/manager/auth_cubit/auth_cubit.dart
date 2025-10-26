import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final UserRepo userRepo;
  final AuthRepo authRepo;
  AuthCubit(this.authRepo, this.userRepo) : super(AuthInitial());

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String photoUrl = AssetsData.defaultPhotoForNewUser,
    String location = '',
    String about = '',
  }) async {
    emit(LoadingRegisterState());
    // register
    final registerResult = await authRepo.register(
      email: email,
      password: password,
    );
    registerResult.fold(
      (failure) => emit(FailureRegisterState(errMessage: failure.errMessage)),
      (success) async {
        final idRes = await authRepo.getCurrentUserId();
        idRes.fold(
          (failure) =>
              emit(FailureRegisterState(errMessage: failure.errMessage)),
          (uid) async {
            // نبني الـ user model
            final newUser = UserModel(
              uid: uid,
              firstName: firstName,
              lastName: lastName,
              email: email,
              photoUrl: photoUrl,
              location: location,
              about: about,
              followersCount: 0,
            );

            // نحفظه في Firestore
            final createRes = await userRepo.createUserProfile(newUser);
            createRes.fold(
              (failure) =>
                  emit(FailureRegisterState(errMessage: failure.errMessage)),
              (_) async {
                // ممكن هنا تعيد إرسال verification أو عمل أي خطوة تانية
                emit(SuccessRegisterState());
              },
            );
          },
        );
      },
    );
  }

  Future<void> resetPassword({required String email}) async {
    emit(LoadingResetState());
    final reset = await authRepo.resetPassword(email: email);
    reset.fold(
      (failure) {
        emit(FailureRegisterState(errMessage: failure.errMessage));
      },
      (reset) {
        emit(SuccessRegisterState());
      },
    );
  }

  Future<void> signOut() async {
    emit(LoadingSignOutState());
    final signOut = await authRepo.signOut();
    signOut.fold(
      (failure) {
        emit(FailureSignOutState(errMessage: failure.errMessage));
      },
      (reset) {
        emit(SuccessSignOutState());
      },
    );
  }
}
