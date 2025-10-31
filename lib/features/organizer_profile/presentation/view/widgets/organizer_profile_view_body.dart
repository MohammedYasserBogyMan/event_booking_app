import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/controllers/follow_cubit/follow_cubit.dart';
import 'package:event_booking_app/core/widgets/profile_action_button.dart';
import 'package:event_booking_app/core/widgets/profile_header.dart';
import 'package:event_booking_app/features/messaging/presentation/view/chat_view.dart';
import 'package:event_booking_app/features/organizer_profile/data/repo/organizer_repo_impl.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/manager/organizer_events/cubit/organizer_events_cubit.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/manager/organizer_view/cubit/organizer_view_cubit.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/tab_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrganizerProfileViewBody extends StatefulWidget {
  const OrganizerProfileViewBody({super.key, required this.organizerId});

  final String organizerId;

  @override
  State<OrganizerProfileViewBody> createState() => _OrganizerProfileViewBodyState();
}

class _OrganizerProfileViewBodyState extends State<OrganizerProfileViewBody> {
  bool _isFollowing = false;
  int _followersCount = 0;
  int _followingCount = 0;

  @override
  void initState() {
    super.initState();
    _checkFollowStatus();
    _loadFollowCounts();
  }

  Future<void> _checkFollowStatus() async {
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is CurrentUserSuccess) {
      final currentUserId = currentUserState.user.uid;
      if (widget.organizerId.isNotEmpty && currentUserId != widget.organizerId) {
        context.read<FollowCubit>().checkFollowStatus(
              followerId: currentUserId,
              followingId: widget.organizerId,
            );
      }
    }
  }

  Future<void> _loadFollowCounts() async {
    final followCubit = context.read<FollowCubit>();

    final followersCount = await followCubit.getFollowerCount(
          userId: widget.organizerId,
        );
    final followingCount = await followCubit.getFollowingCount(
          userId: widget.organizerId,
        );

    if (mounted) {
      setState(() {
        _followersCount = followersCount;
        _followingCount = followingCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => OrganizerProfileCubit(
                OrganizerRepoImpl(FirebaseFirestore.instance),
              )..fetchProfile(widget.organizerId),
        ),
        BlocProvider(
          create:
              (context) => OrganizerEventsCubit(
                OrganizerRepoImpl(FirebaseFirestore.instance),
              )..fetchOrganizerEvents(widget.organizerId),
        ),
      ],
      child: BlocListener<FollowCubit, FollowState>(
        listener: (context, followState) {
          if (followState is FollowSuccess) {
            setState(() {
              _isFollowing = followState.isFollowing;
            });
            // Reload the follow counts after follow/unfollow action
            _loadFollowCounts();
          }
        },
        child: BlocBuilder<OrganizerProfileCubit, OrganizerProfileState>(
          builder: (context, state) {
            if (state is OrganizerProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrganizerProfileFailure) {
              return Center(child: Text(state.message));
            } else if (state is OrganizerProfileSuccess) {
              final user = state.user;
              final currentUserState = context.read<CurrentUserCubit>().state;
              final isOwnProfile = currentUserState is CurrentUserSuccess &&
                  currentUserState.user.uid == widget.organizerId;

              return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  ProfileHeader(
                    name: user.fullName,
                    imageUrl: user.photoUrl,
                    followers: _followersCount,
                    following: _followingCount,
                  ),
                  const SizedBox(height: 20),
                  if (!isOwnProfile) ...[
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: BlocBuilder<FollowCubit, FollowState>(
                              builder: (context, followState) {
                                final isLoading = followState is FollowLoading;
                                return ProfileActionButton(
                                  onPressed: () {
                                    if (!isLoading) {
                                      final currentUserState =
                                          context.read<CurrentUserCubit>().state;
                                      if (currentUserState is CurrentUserSuccess) {
                                        if (_isFollowing) {
                                          context.read<FollowCubit>().unfollowUser(
                                                followerId: currentUserState.user.uid,
                                                followingId: widget.organizerId,
                                              );
                                        } else {
                                          context.read<FollowCubit>().followUser(
                                                followerId: currentUserState.user.uid,
                                                followingId: widget.organizerId,
                                              );
                                        }
                                      }
                                    }
                                  },
                                  icon: _isFollowing
                                      ? Icons.person_remove_outlined
                                      : Icons.person_add_alt_1_outlined,
                                  text: isLoading
                                      ? "Loading..."
                                      : (_isFollowing ? "Unfollow" : "Follow"),
                                  isFilled: !_isFollowing,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ProfileActionButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatView(
                                      otherUserId: widget.organizerId,
                                      otherUserName: user.fullName,
                                      otherUserPhoto: user.photoUrl,
                                    ),
                                  ),
                                );
                              },
                              icon: Icons.chat_bubble_outline,
                              text: "Message",
                              isFilled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 30),
                  Expanded(child: TabBarSection(aboutUser: user.about)),
                ],
              ),
            );
          }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
