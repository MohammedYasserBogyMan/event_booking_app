import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
import 'package:event_booking_app/features/my_events/presentation/manager/my_events_cubit/my_events_cubit.dart';
import 'package:event_booking_app/features/my_events/presentation/views/widgets/my_events_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEventsView extends StatelessWidget {
  const MyEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyEventsCubit(getIt<EventsRepo>()),
      child: const MyEventsViewBody(),
    );
  }
}
