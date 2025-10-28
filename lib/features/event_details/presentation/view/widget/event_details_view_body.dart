import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/event_details/presentation/manager/publisher/cubit/publisher_cubit.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/buy_ticket_overlay_button.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/custom_app_bar.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/event_info_body.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/edit_event_overlay_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';

class EventDetailsViewBody extends StatefulWidget {
  final EventModel event;
  final UserRepo userRepo;

  const EventDetailsViewBody({
    super.key,
    required this.event,
    required this.userRepo,
  });

  @override
  State<EventDetailsViewBody> createState() => _EventDetailsViewBodyState();
}

class _EventDetailsViewBodyState extends State<EventDetailsViewBody> {
  bool isBooked = false;
  bool isCheckingBooking = true;

  @override
  void initState() {
    super.initState();
    _checkBookingStatus();
  }

  void _checkBookingStatus() async {
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is CurrentUserSuccess) {
      final userId = currentUserState.user.uid;

      // Check using the event model directly
      setState(() {
        isBooked = widget.event.isUserAttending(userId);
        isCheckingBooking = false;
      });
    } else {
      setState(() {
        isCheckingBooking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              PublisherCubit(widget.userRepo)..getPublisher(widget.event.publisherId),
      child: BlocBuilder<CurrentUserCubit, CurrentUserState>(
        builder: (context, currentUserState) {
          bool isOwner = false;

          if (currentUserState is CurrentUserSuccess) {
            isOwner = currentUserState.user.uid == widget.event.publisherId;
          }

          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  CustomAppBar(
                    going: widget.event.attendeeCount,
                    imageUrl: widget.event.imageUrl,
                    eventId: widget.event.id,
                    event: widget.event,
                    userRepo: widget.userRepo,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: EventInfoBody(eventModel: widget.event),
                    ),
                  ),
                ],
              ),
              // Show Edit button for owner, Buy Ticket button for others
              if (isOwner)
                EditEventOverlayButton(event: widget.event)
              else
                BuyTicketOverlayButton(
                  price: widget.event.price,
                  event: widget.event,
                  isBooked: isBooked,
                  isFull: widget.event.isFull,
                ),
            ],
          );
        },
      ),
    );
  }
}
