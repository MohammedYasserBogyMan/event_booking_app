import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileViewBody extends StatefulWidget {
  final UserModel user;

  const EditProfileViewBody({super.key, required this.user});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  String? fName, lname, about, location;
  File? selectedImage;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  ImageProvider _getImageProvider() {
    if (selectedImage != null) {
      return FileImage(selectedImage!);
    }

    if (widget.user.photoUrl.isNotEmpty &&
        (widget.user.photoUrl.startsWith('http://') ||
            widget.user.photoUrl.startsWith('https://'))) {
      return CachedNetworkImageProvider(widget.user.photoUrl);
    }

    return const AssetImage(AssetsData.defaultPhotoForNewUser);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          pushToNewScreen(context, locationOfNewScreen: AppRouter.kHomeView);
          context.read<CurrentUserCubit>().fetchCurrentUserInfo();
          showSuccessSnackBar(context, message: 'Profile updated successfully');
        } else if (state is EditProfileFailure) {
          showErrorSnackBar(context, message: state.message);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: _getImageProvider(),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFiled(
                    initialValue: widget.user.firstName,
                    onSaved: (p0) {
                      fName = p0;
                    },
                    icon: Icons.person,
                    hintText: "First Name",
                  ),
                  const SizedBox(height: 15),
                  CustomTextFiled(
                    initialValue: widget.user.lastName,
                    onSaved: (p0) {
                      lname = p0;
                    },
                    icon: Icons.person_outline,
                    hintText: "Last Name",
                  ),
                  const SizedBox(height: 15),
                  CustomTextFiled(
                    initialValue: widget.user.about,
                    onSaved: (p0) {
                      about = p0;
                    },
                    icon: Icons.info_outline,
                    hintText: "About",
                  ),
                  const SizedBox(height: 15),
                  CustomTextFiled(
                    initialValue: widget.user.location,
                    onSaved: (p0) {
                      location = p0;
                    },
                    icon: Icons.location_on_outlined,
                    hintText: "Location",
                  ),
                  const SizedBox(height: 30),
                  state is EditProfileLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                        text: "Save Changes",
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            final updatedUser = widget.user.copyWith(
                              firstName: fName ?? widget.user.firstName,
                              lastName: lname ?? widget.user.lastName,
                              about: about ?? widget.user.about,
                              location: location ?? widget.user.location,
                            );
                            context.read<EditProfileCubit>().updateUser(
                              updatedUser,
                              profileImage: selectedImage,
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
