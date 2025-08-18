import 'package:event_booking_app/features/home/presentation/view/widgets/create_event_view_body.dart';
import 'package:flutter/material.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CreateEventViewBody()));
  }
}
