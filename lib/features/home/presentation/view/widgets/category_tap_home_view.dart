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
    CategoryModel(name:"Sports",icon: Icons.sports,color: Colors.red ),
    CategoryModel(name:"Music",icon: Icons.music_note,color: Colors.orange ),
    CategoryModel(name: "Food",icon: Icons.restaurant,color: Colors.green ),
    CategoryModel(name: "Tech",icon:  Icons.computer,color:  Colors.blue ),
    CategoryModel(name: "Art",icon:  Icons.brush,color:  Colors.purple ),
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
