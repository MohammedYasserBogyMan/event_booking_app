import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/create_event/presentation/manager/create_event_cubit/cubit/create_event_cubit.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo_impl.dart';
import 'package:event_booking_app/features/create_event/presentation/view/widgets/create_event_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateEventCubit(EventRepoImpl()),
      child: Scaffold(
        appBar: AppBar(title: Text('Create Event', style: Styels.textStyle16)),
        body: SafeArea(child: CreateEventViewBody()),
      ),
    );
  }
}
