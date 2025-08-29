import 'dart:developer';

import 'package:event_booking_app/core/theme/search_filter_color.dart';
import 'package:event_booking_app/core/widgets/search_and_filter_section.dart';
import 'package:event_booking_app/core/widgets/news_list.dart';
import 'package:event_booking_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:event_booking_app/features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchAndFilterSection(
            enabled: true,
            colors: SearchFilterColor.primaryTheme,
            onSubmit: (category) {
              log(category);
              BlocProvider.of<SearchCubit>(
                context,
              ).searchCategory(category: category);
            },
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchStates>(
            builder: (context, state) {
              if (state is SuccessSearchState) {
                return NewsList(eventUi: state.events);
              } else if (state is FailureSearchState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is LoadingSearchState) {
                return Center(child: CircularProgressIndicator());
              }
              return Text("Please Search");
            },
          ),
        ),
      ],
    );
  }
}
