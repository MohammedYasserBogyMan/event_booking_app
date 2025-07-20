import 'package:event_booking_app/features/search/presentation/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return NewsCard();
        },
      ),
    );
  }
}
