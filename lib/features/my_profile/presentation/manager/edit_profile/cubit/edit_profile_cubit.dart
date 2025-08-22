import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.userRepo) : super(EditProfileInitial());
  final UserRepo userRepo;

  Future<void> updateUser(UserModel user) async {
    emit(EditProfileLoading());
    final res = await userRepo.updateUser(user);
    res.fold(
      (failure) => emit(EditProfileFailure(failure.errMessage)),
      (_) => emit(EditProfileSuccess()),
    );
  }
}
