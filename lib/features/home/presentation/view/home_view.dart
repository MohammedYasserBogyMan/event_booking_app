import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_drawer.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomeViewBody(),
    Center(child: Text("Events")),
    Center(child: Text("Map")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: _pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.primary,
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: () {},
          icon: Image.asset(AssetsData.addIcon, width: 20, height: 20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
