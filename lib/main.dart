import 'package:event_booking_app/features/home/presentation/view/home_view.dart';
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
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
