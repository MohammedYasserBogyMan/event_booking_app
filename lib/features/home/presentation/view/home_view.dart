import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/features/home/presentation/manager/home_cubit/cubit/home_cubit.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_bottom_navbar.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_drawer.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        onPressed: () {},
        backgroundColor: AppColor.primary,
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: () async {
            final result = await GoRouter.of(
              context,
            ).push(AppRouter.kCreateEventView);
            if (result == true) {
              context.read<HomeCubit>().getAllEvents();
            }
          },
          icon: Image.asset(AssetsData.addIcon, width: 20, height: 20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
