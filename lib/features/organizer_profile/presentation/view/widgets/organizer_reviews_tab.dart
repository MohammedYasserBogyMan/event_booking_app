import 'package:flutter/material.dart';

class ReviewsTap extends StatelessWidget {
  const ReviewsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          return Center(child: Text("ReviewsTab"));
        },
      ),
    );
  }
}
