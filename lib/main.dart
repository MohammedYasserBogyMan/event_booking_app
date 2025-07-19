import 'package:event_booking_app/features/event_details/presentation/view/event_details_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerConfig: AppRouter.router,
    // debugShowCheckedModeBanner: false,
    //
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventDetailsView(),
    );
  }
}
