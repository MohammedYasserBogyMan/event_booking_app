import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/search/filters/widgets/category_icon.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryIcon(iconPath: iconPath, isSelected: isSelected),
        const SizedBox(height: 6),
        Text(label, style: Styels.textStyleRegular14.copyWith(color: Colors.black)),
      ],
    );
  }
}
