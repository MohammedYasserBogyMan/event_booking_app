import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/data/model/drawer_menu_item_model.dart';
import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({super.key, required this.drawerMenuItemModel});
  final DrawerMenuItemModel drawerMenuItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(drawerMenuItemModel.icon, color: AppColor.menuWhiteIconColor),
        SizedBox(width: 10),
        Text(drawerMenuItemModel.text, style: Styels.textStyle16),
      ],
    );
  }
}
