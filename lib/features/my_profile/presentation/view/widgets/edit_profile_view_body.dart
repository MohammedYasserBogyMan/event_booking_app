import 'dart:io';

import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/create_event/presentation/views/widgets/image_picker_field.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/models/user_model.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          pushToNewScreen(context, locationOfNewScreen: AppRouter.kHomeView);
          context.read<CurrentUserCubit>().fetchCurrentUserInfo();
          showSnackBar(context, message: 'Profile updated successfully!');
        } else if (state is EditProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                CustomTextFiled(
                  onSaved: (p0) {
                    fName = p0;
                  },
                  icon: Icons.person,
                  hintText: "First Name",
                ),
                const SizedBox(height: 15),
                CustomTextFiled(
                  onSaved: (p0) {
                    lname = p0;
                  },
                  icon: Icons.person_outline,
                  hintText: "Last Name",
                ),
                const SizedBox(height: 15),
                CustomTextFiled(
                  onSaved: (p0) {
                    about = p0;
                  },
                  icon: Icons.info_outline,
                  hintText: "About",
                ),
                const SizedBox(height: 15),
                CustomTextFiled(
                  onSaved: (p0) {
                    location = p0;
                  },
                  icon: Icons.location_on_outlined,
                  hintText: "Location",
                ),
                const SizedBox(height: 15),
                ImagePickerField(
                  validator: (file) {
                    if (file == null) {
                      return "Please upload an image";
                    }
                    return null;
                  },
                  onSaved: (file) => selectedImage = file,
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
                            firstName: fName,
                            lastName: lname,
                            about: about,
                            location: location,
                          );
                          context.read<EditProfileCubit>().updateUser(
                            updatedUser,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
