import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/features/auth/presentation/view/login_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/register_view.dart';
import 'package:event_booking_app/features/event_details/presentation/view/empty_events_view.dart';
import 'package:event_booking_app/features/home/presentation/view/home_view.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/my_profile_view.dart';
import 'package:event_booking_app/features/notification/presentation/view/notification_view.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/onboarding_pages.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/organizer_profile_view.dart';
import 'package:event_booking_app/features/search/presentation/view/search_view.dart';
import 'package:event_booking_app/features/see_all_events/presentation/view/see_all_events_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    debugShowCheckedModeBanner: false,
    
    );
    // return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
