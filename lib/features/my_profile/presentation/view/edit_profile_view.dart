import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        bool isLoading = state is EditProfileLoading;
        return CustomModalCircularProgress(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Complete Your Profile",
                style: Styels.textStyleMedium20,
              ),
            ),
            body: EditProfileViewBody(user: user),
          ),
        );
      },
    );
  }
}
