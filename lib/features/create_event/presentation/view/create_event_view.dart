import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/create_event/presentation/view/widgets/create_event_view_body.dart';
import 'package:flutter/material.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Event', style: Styels.textStyle16)),
      body: SafeArea(child: CreateEventViewBody()),
    );
  }
}
