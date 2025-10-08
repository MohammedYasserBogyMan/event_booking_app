import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_bottom_navbar.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_drawer.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9f9fb),
      drawer: const HomeDrawer(),
      body: HomePages.pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: () {},
        backgroundColor: AppColor.primary,
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: () async {
            await goToCreateEvent(context);
          },
          icon: Image.asset(AssetsData.addIcon, width: 20, height: 20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> goToCreateEvent(BuildContext context) async {
    final result = pushToNewScreen(
      context,
      locationOfNewScreen: AppRouter.kCreateEventView,
    );

    if (result == true) {
      context.read<HomeCubit>().getAllEvents();
    }
  }
}
