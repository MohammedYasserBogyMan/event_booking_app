import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/services/image_upload_service.dart';
import 'package:meta/meta.dart';

part 'edit_profile_states.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.userRepo) : super(EditProfileInitial());
  final UserRepo userRepo;
  final ImageUploadService _imageUploadService = ImageUploadService();

  Future<void> updateUser(UserModel user, {File? profileImage}) async {
    emit(EditProfileLoading());

    try {
      UserModel updatedUser = user;

      // If user selected a new profile image, upload it
      if (profileImage != null) {
        final String newImageUrl = await _imageUploadService.updateProfileImage(
          newImage: profileImage,
          userId: user.uid,
          oldImageUrl: user.photoUrl,
        );

        // Update user model with new image URL
        updatedUser = user.copyWith(photoUrl: newImageUrl);
      }

      // Update user profile in Firestore
      final res = await userRepo.updateUser(updatedUser);
      res.fold(
        (failure) => emit(EditProfileFailure(failure.errMessage)),
        (_) => emit(EditProfileSuccess()),
      );
    } catch (e) {
      emit(EditProfileFailure('Failed to update profile: ${e.toString()}'));
    }
  }
}
