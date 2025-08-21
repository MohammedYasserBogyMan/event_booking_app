import 'package:event_booking_app/features/search/data/models/event_ui_model.dart';
import 'package:event_booking_app/features/search/presentation/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.eventUi});
  final List<EventUiModel> eventUi;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: eventUi.length,
        itemBuilder: (context, index) {
          return NewsCard(eventUiModel: eventUi[index]);
        },
      ),
    );
  }
}
