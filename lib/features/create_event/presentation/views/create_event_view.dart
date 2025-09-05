import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/create_event/presentation/manager/create_event_cubit/create_event_cubit.dart';
import 'package:event_booking_app/features/create_event/presentation/views/widgets/create_event_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      builder: (context, state) {
        bool isLoading = state is CreateEventLoading;
        return ModalProgressHUD(
          blur: 10,
          progressIndicator: CircularProgressIndicator(color: AppColor.primary),
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Create Event', style: Styels.textStyle16),
            ),
            body: CreateEventViewBody(),
          ),
        );
      },
    );
  }
}
