import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/controllers/follow_cubit/follow_cubit.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({
    super.key,
    required this.organizerId,
    required this.isFollowing,
  });

  final String organizerId;
  final bool isFollowing;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  late bool _isFollowing;

  @override
  void initState() {
    super.initState();
    _isFollowing = widget.isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    final currentUserState = context.read<CurrentUserCubit>().state;

    // Check if user is logged in and get user ID
    if (currentUserState is! CurrentUserSuccess) {
      return const SizedBox.shrink(); // User not logged in
    }

    final currentUserId = currentUserState.user.uid;

    if (currentUserId == widget.organizerId) {
      return const SizedBox.shrink(); // Don't show follow button for own profile
    }

    return BlocListener<FollowCubit, FollowState>(
      listener: (context, state) {
        if (state is FollowSuccess) {
          setState(() {
            _isFollowing = state.isFollowing;
          });

          showSuccessSnackBar(
            context,
            message: state.isFollowing
                ? 'Followed successfully'
                : 'Unfollowed successfully',
          );
        } else if (state is FollowFailure) {
          showErrorSnackBar(
            context,
            message: state.message,
          );
        }
      },
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          foregroundColor: _isFollowing ? Colors.white : AppColor.primary,
          backgroundColor:
              _isFollowing ? AppColor.primary : const Color(0xffEAEDFF),
        ),
        onPressed: () {
          if (_isFollowing) {
            context.read<FollowCubit>().unfollowUser(
              followerId: currentUserId,
              followingId: widget.organizerId,
            );
          } else {
            context.read<FollowCubit>().followUser(
              followerId: currentUserId,
              followingId: widget.organizerId,
            );
          }
        },
        child: BlocBuilder<FollowCubit, FollowState>(
          builder: (context, state) {
            if (state is FollowLoading) {
              return const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }
            return Text(_isFollowing ? 'Following' : 'Follow');
          },
        ),
      ),
    );
  }
}
