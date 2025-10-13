import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/data/model/category_tap_model.dart';
import 'package:flutter/material.dart';

class CategoryTapItem extends StatelessWidget {
  const CategoryTapItem({
    super.key,
    required this.isSelected,
    required this.cat,
  });

  final bool isSelected;
  final CategoryModel cat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushToNewScreen(context, locationOfNewScreen: cat.route);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: cat.color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(cat.icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              cat.name,
              style: Styels.textStyleRegular15.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
