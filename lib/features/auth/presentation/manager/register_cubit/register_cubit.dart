import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/register_cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  final UserRepo userRepo;
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo, this.userRepo) : super(InitialRegisterState());
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
              followingCount: 0,
            );

            // نحفظه في Firestore
            final createRes = await userRepo.createUserProfile(newUser);
            createRes.fold(
              (failure) =>
                  emit(FailureRegisterState(errMessage: failure.errMessage)),
              (_) async {
                // Send user model with state to redirect to verification
                emit(SuccessRegisterState(userModel: newUser));
              },
            );
          },
        );
      },
    );
  }
  
 
}

