import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/features/bookmarks/presentation/manager/bookmark_cubit/bookmark_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkIcon extends StatelessWidget {
  final String eventId;
  const BookmarkIcon({super.key, required this.eventId});

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
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(170, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: const Color(0xffEB5757),
            ),
          ),
        );
      },
    );
  }
}
