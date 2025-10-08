import 'package:flutter/material.dart';

class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(170, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.bookmark, color: Color(0xffEB5757)),
    );
  }
}
