import 'package:flutter/material.dart';

class Indecator extends StatelessWidget {
  const Indecator({
    super.key,
    required this.pageCount,
    required this.currentPage,
  });

  final int pageCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        pageCount,
        (index) => Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                currentPage == index
                    ? Colors.white
                    : Colors.white.withAlpha(50),
          ),
        ),
      ),
    );
  }
}
