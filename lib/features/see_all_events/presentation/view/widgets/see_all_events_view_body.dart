import 'package:event_booking_app/features/see_all_events/presentation/view/widgets/news_list_view.dart';
import 'package:flutter/cupertino.dart';

class SeeAllEventsViewBody extends StatelessWidget {
  const SeeAllEventsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [SizedBox(height: 20), Expanded(child: NewsListView())],
      ),
    );
  }
}
