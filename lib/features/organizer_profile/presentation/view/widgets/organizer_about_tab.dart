import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Center(child: Text("AboutTab"));
        },
      ),
    );
  }
}