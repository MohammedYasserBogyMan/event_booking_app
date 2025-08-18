import 'package:event_booking_app/features/home/presentation/view/widgets/home_view_header.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/category_tap_home_view.dart';
import 'package:flutter/material.dart';

class HomeHeaderWithCategory extends StatefulWidget {
  const HomeHeaderWithCategory({super.key});

  @override
  State<HomeHeaderWithCategory> createState() => _HomeHeaderWithCategoryState();
}

class _HomeHeaderWithCategoryState extends State<HomeHeaderWithCategory> {
  int selectedCategoryIndex = 0;

  void _onCategoryChanged(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const HomeViewHeader(),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height * 0.21,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: HomeViewCategorysTaps(
              selectedIndex: selectedCategoryIndex,
              onTap: _onCategoryChanged,
            ),
          ),
        ),
      ],
    );
  }
}
