import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/data/model/drawer_menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({super.key, required this.drawerMenuItemModel});
  final DrawerMenuItemModel drawerMenuItemModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
        GoRouter.of(context).push(drawerMenuItemModel.route);
      },
      child: Row(
        children: [
          Icon(drawerMenuItemModel.icon, color: AppColor.menuWhiteIconColor),
          const SizedBox(width: 10),
          Text(drawerMenuItemModel.text, style: Styels.textStyleRegular16),
        ],
      ),
    );
  }
}
