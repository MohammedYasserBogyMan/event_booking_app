import 'package:event_booking_app/core/theme/app_theme.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EventBooking());
}

class EventBooking extends StatelessWidget {
  const EventBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
