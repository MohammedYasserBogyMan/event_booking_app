import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/features/bookmarks/presentation/manager/bookmark_cubit/bookmark_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomIcon extends StatelessWidget {
  final String eventId;
  const CustomIcon({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        final isBookmarked = context.read<BookmarkCubit>().isEventBookmarked(eventId);

        return GestureDetector(
          onTap: () {
            final userState = context.read<CurrentUserCubit>().state;
            if (userState is CurrentUserSuccess) {
              context.read<BookmarkCubit>().toggleBookmark(
                userId: userState.user.uid,
                eventId: eventId,
              );
            }
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(88, 142, 142, 142),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
              size: 25,
            ),
          ),
        );
      },
    );
  }
}
