import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/event_details/presentation/manager/publisher/cubit/publisher_cubit.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/buy_ticket_overlay_button.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/custom_app_bar.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/event_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';

class EventDetailsViewBody extends StatelessWidget {
  final EventModel event;
  final UserRepo userRepo;

  const EventDetailsViewBody({
    super.key,
    required this.event,
    required this.userRepo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              PublisherCubit(userRepo)..getPublisher(event.publisherId),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CustomAppBar(
                going: event.attendeeCount,
                imageUrl: event.imageUrl,
                eventId: event.id,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: EventInfoBody(eventModel: event),
                ),
              ),
            ],
          ),
          BuyTicketOverlayButton(price: event.price),
        ],
      ),
    );
  }
}
