import 'package:event_booking_app/features/home/data/model/drawer_menu_item_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/drawer_menu_item.dart';
import 'package:flutter/material.dart';

class DrawerMenuList extends StatelessWidget {
  DrawerMenuList({super.key});
  final List<DrawerMenuItemModel> menuList = [
    DrawerMenuItemModel(
      text: "My Profile",
      icon: Icons.person_outline_outlined,
    ),
    DrawerMenuItemModel(text: "Message", icon: Icons.message_outlined),
    DrawerMenuItemModel(text: "Calender", icon: Icons.calendar_today_outlined),
    DrawerMenuItemModel(text: "Bookmark", icon: Icons.bookmark_outline),
    DrawerMenuItemModel(text: "Contact Us", icon: Icons.mail_outline),
    DrawerMenuItemModel(text: "Settings", icon: Icons.settings_outlined),
    DrawerMenuItemModel(text: "Helps & FAQs", icon: Icons.help_outline),
    DrawerMenuItemModel(text: "Sign Out", icon: Icons.search),
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
