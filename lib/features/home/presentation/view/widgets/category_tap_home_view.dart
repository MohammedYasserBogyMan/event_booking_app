import 'package:event_booking_app/features/home/data/model/category_tap_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/category_tap_itemm.dart';
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
    CategoryModel("Sports", Icons.sports, Colors.red),
    CategoryModel("Music", Icons.music_note, Colors.orange),
    CategoryModel("Food", Icons.restaurant, Colors.green),
    CategoryModel("Tech", Icons.computer, Colors.blue),
    CategoryModel("Art", Icons.brush, Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
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
