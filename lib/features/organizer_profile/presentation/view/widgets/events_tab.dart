import 'package:event_booking_app/features/organizer_profile/presentation/manager/events_cubit/events_tap_cubit.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsTap extends StatelessWidget {
  const EventsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsTabCubit, EventsTabState>(
      builder: (context, state) {
        if (state is SuccessEventsTabState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: state.events.length,
              itemBuilder: (context, index) {
                return Events(events: state.events[index]);
              },
            ),
          );
        } else if (state is FailureEventsTabState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadingEventsTapState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Text("Error");
        }
      },
    );
  }
}
