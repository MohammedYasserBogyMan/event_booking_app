import 'package:event_booking_app/core/widgets/modal_circular_progress.dart';
import 'package:event_booking_app/features/create_event/presentation/manager/create_event_cubit/create_event_cubit.dart';
import 'package:event_booking_app/features/create_event/presentation/views/widgets/create_event_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        bool isLoading = state is CreateEventLoading;
        return CustomModalCircularProgress(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Create New Event',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  color: Colors.grey[200],
                  height: 1,
                ),
              ),
            ),
            body: const CreateEventViewBody(),
          ),
        );
      },
    );
  }
}
