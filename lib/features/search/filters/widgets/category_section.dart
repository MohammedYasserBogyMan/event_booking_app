import 'package:event_booking_app/features/search/filters/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {'icon': 'assets/images/SportsIcon.svg', 'label': 'Sports'},
    {'icon': 'assets/images/musicIcon.svg', 'label': 'Music'},
    {'icon': 'assets/images/atrIcon.svg', 'label': 'Art'},
    {'icon': 'assets/images/foodIcon.svg', 'label': 'Food'},
    {'icon': 'assets/images/foodIcon.svg', 'label': 'Food'},
    {'icon': 'assets/images/foodIcon.svg', 'label': 'Food'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: CategoryItem(
              label: category['label']!,
              iconPath: category['icon']!,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}
