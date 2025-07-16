import 'package:event_booking_app/features/home/presentation/view/widgets/drawer_menu_item.dart';
import 'package:flutter/material.dart';

class DrawerMenuList extends StatelessWidget {
  const DrawerMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerMenuItem(text: "My Profile", icon: Icons.person_outline_outlined),
        SizedBox(height: 33),
        DrawerMenuItem(text: "Massage", icon: Icons.message_outlined),
        SizedBox(height: 33),
        DrawerMenuItem(text: "Calender", icon: Icons.calendar_today_outlined),
        SizedBox(height: 33),
        DrawerMenuItem(text: "Bookmark", icon: Icons.bookmark_outline),
        SizedBox(height: 33),
        DrawerMenuItem(text: "Contact Us", icon: Icons.mail_outline),
        SizedBox(height: 33),
        DrawerMenuItem(text: "Settings", icon: Icons.settings_outlined),
        SizedBox(height: 33),
        DrawerMenuItem(text: "Helps & FAQs", icon: Icons.help_outline),
        SizedBox(height: 33),
        DrawerMenuItem(text: "Sign Out", icon: Icons.search),
        SizedBox(height: 33),
      ],
    );
  }
}
