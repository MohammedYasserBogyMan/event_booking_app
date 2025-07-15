import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.format_align_left),
              ),
        ),
      ),
      body: HomeViewBody(),
    );
  }
}
