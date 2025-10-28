import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/features/home/data/model/drawer_menu_item_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/drawer_menu_item.dart';
import 'package:flutter/material.dart';

class DrawerMenuList extends StatelessWidget {
  DrawerMenuList({super.key});
  final List<DrawerMenuItemModel> menuList = [
    DrawerMenuItemModel(
      text: "My Profile",
      icon: Icons.person_outline_outlined,
      route: AppRouter.kMyProfile,
    ),
    DrawerMenuItemModel(
      text: "Message",
      icon: Icons.chat_bubble_outline,
      route: AppRouter.kMassageView,
    ),
    DrawerMenuItemModel(
      text: "Calender",
      icon: Icons.calendar_today_outlined,
      route: AppRouter.kCalenderView,
    ),
    DrawerMenuItemModel(
      text: "Bookmark",
      icon: Icons.bookmark_outline,
      route: AppRouter.kBookMarkView,
    ),
    DrawerMenuItemModel(
      text: "My Bookings",
      icon: Icons.confirmation_number_outlined,
      route: AppRouter.kMyBookingsView,
    ),
    DrawerMenuItemModel(
      text: "Contact Us",
      icon: Icons.mail_outline,
      route: AppRouter.kContactUsView,
    ),
    DrawerMenuItemModel(
      text: "Settings",
      icon: Icons.settings_outlined,
      route: AppRouter.kSettingView,
    ),
    DrawerMenuItemModel(
      text: "Helps & FAQs",
      icon: Icons.help_outline,
      route: AppRouter.kHelpAndFaqsView,
    ),
    DrawerMenuItemModel(
      text: "Sign Out",
      icon: Icons.logout_rounded,
      route: AppRouter.kSignOutView,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          menuList
              .map(
                (item) => Column(
                  children: [
                    DrawerMenuItem(drawerMenuItemModel: item),
                    const SizedBox(height: 33),
                  ],
                ),
              )
              .toList(),
    );
  }
}
