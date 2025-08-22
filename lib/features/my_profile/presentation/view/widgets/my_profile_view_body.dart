import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/core/widgets/profile_action_button.dart';
import 'package:event_booking_app/core/widgets/profile_header.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/profile_cubit/cubit/profile_view_cubit.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/widgets/interests_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyProfileViewBody extends StatelessWidget {
  const MyProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewCubit, ProfileViewState>(
      builder: (context, state) {
        if (state is ProfileViewLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileViewFailure) {
          return Center(child: Text(state.message));
        } else if (state is ProfileViewSuccess) {
          final user = state.user;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  ProfileHeader(
                    name: user.fullName,
                    imageUrl: user.photoUrl,
                    followers: user.followersCount,
                    following: 0,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 220,
                      child: ProfileActionButton(
                        isFilled: false,
                        onPressed: () async {
                          final result = await GoRouter.of(
                            context,
                          ).push(AppRouter.kEditProfileView, extra: user);

                          if (result == true) {
                            context.read<ProfileViewCubit>().fetchMyProfile();
                          }
                        },
                        icon: Icons.edit_note_rounded,
                        text: "Edit Profile",
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Text("About Me", style: Styels.textStyle19),
                  const SizedBox(height: 10),
                  Text(user.about, style: Styels.textStyle16),
                  const SizedBox(height: 40),
                  const InterestsSection(),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
