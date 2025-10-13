import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/features/home/data/model/category_tap_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/category_tap_item.dart';
import 'package:flutter/material.dart';

class HomeViewCategorysTaps extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  HomeViewCategorysTaps({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<CategoryModel> categories = [
    CategoryModel(
      name: "Sports",
      icon: Icons.sports,
      color: Color(0xffF0635A),
      route: AppRouter.kSportsCategory,
    ),
    CategoryModel(
      name: "Music",
      icon: Icons.music_note,
      color: Color(0xffF59762),
      route: AppRouter.kMusicCategory,
    ),
    CategoryModel(
      name: "Food",
      icon: Icons.restaurant,
      color: Color(0xff29D697),
      route: AppRouter.kFoodCategory,
    ),
    CategoryModel(
      name: "Tech",
      icon: Icons.computer,
      color: Color(0xff46CDFB),
      route: AppRouter.kTechCategory,
    ),
    CategoryModel(
      name: "Art",
      icon: Icons.brush,
      color: Color(0xffF0635A),
      route: AppRouter.kArtCategory,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 25),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: CategoryTapItem(isSelected: isSelected, cat: cat),
          );
        },
      ),
    );
  }
}
