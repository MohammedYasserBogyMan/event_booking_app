import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/see_all_events/presentation/view/widgets/see_all_events_view_body.dart';
import 'package:flutter/material.dart';

class SeeAllEventsView extends StatelessWidget {
  const SeeAllEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: SeeAllEventsViewBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.search, size: 30, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert, size: 30, color: Colors.black),
          onPressed: () {},
        ),
      ],
      title: Text("Events", style: Styels.textStyleMedium24),
    );
  }
}
