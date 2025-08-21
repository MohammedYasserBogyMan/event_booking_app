import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/core/widgets/profile_action_button.dart';
import 'package:event_booking_app/core/widgets/profile_header.dart';
import 'package:event_booking_app/features/organizer_profile/data/repo/organizer_repo_impl.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/manager/organizer_view/cubit/organizer_view_cubit.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/tab_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrganizerProfileViewBody extends StatelessWidget {
  const OrganizerProfileViewBody({super.key, required this.organizerId});

  final String organizerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => OrganizerProfileCubit(
            OrganizerRepoImpl(FirebaseFirestore.instance),
          )..fetchProfile(organizerId),
      child: BlocBuilder<OrganizerProfileCubit, OrganizerProfileState>(
        builder: (context, state) {
          if (state is OrganizerProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrganizerProfileFailure) {
            return Center(child: Text(state.message));
          } else if (state is OrganizerProfileSuccess) {
            final user = state.user;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  ProfileHeader(
                    name: user.fullName,
                    imageUrl: user.photoUrl,
                    followers: user.followersCount,
                    following: 700,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileActionButton(
                          onPressed: () {},
                          icon: Icons.person_add_alt_1_outlined,
                          text: "Follow",
                          isFilled: true,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ProfileActionButton(
                          onPressed: () {},
                          icon: Icons.message_outlined,
                          text: "Message",
                          isFilled: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Expanded(child: TabBarSection(organizerId: organizerId)),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
