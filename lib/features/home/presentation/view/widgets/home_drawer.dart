import 'package:event_booking_app/features/home/presentation/view/widgets/custom_drawer_footer.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_drawer_header.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/drawer_menu_list.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  CustomDrawerHeader(),
                  const SizedBox(height: 50),
                  DrawerMenuList(),
                  Expanded(child: const SizedBox(height: 20)),
                  CustomDrawerFooter(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
