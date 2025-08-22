import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final UserRepo userRepo;
  AuthCubit(this.authRepo, this.userRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoadingLoginState());
    final login = await authRepo.login(email: email, password: password);
    login.fold(
      (failure) {
        return emit(FailureLoginState(errMessage: failure.errMessage));
      },
      (login) {
        return emit(SuccessLoginState());
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String photoUrl = '',
    String location = '',
    String about = '',
  }) async {
    emit(LoadingRegisterState());

    final registerRes = await authRepo.register(
      email: email,
      password: password,
    );
    registerRes.fold(
      (failure) => emit(FailureRegisterState(errMessage: failure.errMessage)),
      (r) async {
        // الآن نحصل على uid من auth (الموجود بالفعل في AuthRepo)
        final idRes = await authRepo.getCurrentUserId();
        idRes.fold(
          (failure) =>
              emit(FailureRegisterState(errMessage: failure.errMessage)),
          (uid) async {
            // نبني الـ user model
            final user = UserModel(
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
            final createRes = await userRepo.createUserProfile(user);
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

  Future<void> reset({required String email}) async {
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
}
