import 'package:event_booking_app/features/organizer_profile/presentation/view/widgets/organizer_profile_view_body.dart';
import 'package:flutter/material.dart';

class OrganizerProfileView extends StatelessWidget {
  const OrganizerProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: OrganizerProfileViewBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.double_arrow_outlined)),
      ],
    );
  }
}
