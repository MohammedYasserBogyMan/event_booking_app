import 'package:event_booking_app/features/see_all_events/presentation/view/widgets/news_card.dart';
import 'package:flutter/cupertino.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return NewsCard();  
      },
    );
  }
}
