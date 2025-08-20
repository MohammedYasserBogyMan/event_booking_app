import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/features/see_all_events/presentation/view/widgets/news_card.dart';
import 'package:flutter/cupertino.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.events});
  final List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return NewsCard(eventModel: events[index]);
      },
    );
  }
}
