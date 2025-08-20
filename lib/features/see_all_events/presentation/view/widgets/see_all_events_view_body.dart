import 'package:event_booking_app/features/see_all_events/presentation/manager/see_all_events_cubit/see_all_events_cubit.dart';
import 'package:event_booking_app/features/see_all_events/presentation/manager/see_all_events_cubit/see_all_events_states.dart';
import 'package:event_booking_app/features/see_all_events/presentation/view/widgets/news_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllEventsViewBody extends StatelessWidget {
  const SeeAllEventsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllEventsCubit, SeeAllEventsStates>(
      builder: (context, state) {
        if (state is SuccessSeeAllEventsState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20),
                Expanded(child: NewsListView(events: state.events)),
              ],
            ),
          );
        } else if (state is FailureSeeAllEventsState) {
          return Center(child: Text(state.errMessage));
        } else if (state is LoadingSeeAllEventsState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Text("Error");
        }
      },
    );
  }
}
