import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/features/create_event/presentation/views/widgets/image_picker_field.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/models/user_model.dart';

class EditProfileView extends StatefulWidget {
  final UserModel user;

  const EditProfileView({super.key, required this.user});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController aboutController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    aboutController = TextEditingController(text: widget.user.about);
    locationController = TextEditingController(text: widget.user.location);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    aboutController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          Navigator.pop(context, true);
          showSnackBar(context, message: 'Profile updated successfully!');
        } else if (state is EditProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Profile", style: Styels.textStyle24),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextFiled(
                  controller: firstNameController,
                  icon: Icons.person,
                  hintText: "First Name",
                ),
                const SizedBox(height: 15),
                CustomTextFiled(
                  controller: lastNameController,
                  icon: Icons.person_outline,
                  hintText: "Last Name",
                ),
                const SizedBox(height: 15),
                CustomTextFiled(
                  controller: aboutController,
                  icon: Icons.info_outline,
                  hintText: "About",
                ),
                const SizedBox(height: 15),
                CustomTextFiled(
                  controller: locationController,
                  icon: Icons.location_on_outlined,
                  hintText: "Location",
                ),
                const SizedBox(height: 15),
                ImagePickerField(),
                const SizedBox(height: 30),
                state is EditProfileLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                      text: "Save Changes",
                      onPressed: () {
                        final updatedUser = widget.user.copyWith(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          about: aboutController.text,
                          location: locationController.text,
                        );

                        context.read<EditProfileCubit>().updateUser(
                          updatedUser,
                        );
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
