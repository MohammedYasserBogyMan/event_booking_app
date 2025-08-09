import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: SearchViewBody());
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text("Search", style: Styels.textStyle24));
  }
}
