import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class SearchAndFilterAppbarSection extends StatelessWidget {
  const SearchAndFilterAppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.search, color: Colors.white, size: 30),
        SizedBox(width: 10),
        Container(height: 25, width: 1.5, color: Colors.white.withAlpha(70)),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white.withAlpha(70)),
              border: InputBorder.none,
            ),
            style: Styels.textStyle20,
          ),
        ),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(20),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            children: [
              Icon(Icons.tune, color: Colors.white),
              SizedBox(width: 5),
              Text('Filters', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
