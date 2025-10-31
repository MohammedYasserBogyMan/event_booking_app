import 'package:event_booking_app/features/messaging/presentation/view/conversations_view.dart';
import 'package:flutter/material.dart';

class MassageView extends StatelessWidget {
  const MassageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirect to the new conversations view
    return const ConversationsView();
  }
}
