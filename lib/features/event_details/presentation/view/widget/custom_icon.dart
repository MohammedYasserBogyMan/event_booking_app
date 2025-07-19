import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(88, 142, 142, 142),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(Icons.bookmark, color: Colors.white, size: 25),
    );
  }
}
