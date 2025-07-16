import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/drawer_menu_list.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Image(
                width: 60,
                height: 60,
                image: AssetImage(AssetsData.profilePhoto),
              ),
              const SizedBox(height: 15),
              Text("Ashfak Sayem", style: Styels.textStyle19),
              SizedBox(height: 50),
              DrawerMenuList(),
              SizedBox(height: 50),
              GestureDetector(
                child: Image(
                  width: 150,
                  height: 50,
                  image: AssetImage(AssetsData.proBadge),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
