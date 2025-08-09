import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const CategoryIcon({
    super.key,
    required this.iconPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : Colors.transparent,
        shape: BoxShape.circle,
        border:
            isSelected
                ? null
                : Border.all(color: AppColor.lightgray, width: 0.8),
      ),
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        iconPath,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.white : AppColor.lightgray,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
