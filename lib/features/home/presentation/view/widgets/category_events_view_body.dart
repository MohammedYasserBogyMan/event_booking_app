import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/data/model/category_tap_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_card.dart';
import 'package:event_booking_app/features/see_all_events/presentation/manager/see_all_events_cubit/see_all_events_cubit.dart';
import 'package:event_booking_app/features/see_all_events/presentation/manager/see_all_events_cubit/see_all_events_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryEventsViewBody extends StatelessWidget {
  final CategoryModel category;
  const CategoryEventsViewBody({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: category.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    category.icon,
                    color: category.color,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${category.name} Events',
                      style: Styels.textStyleMedium24,
                    ),
                    Text(
                      'Discover amazing events',
                      style: Styels.textStyleRegular14.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: BlocBuilder<SeeAllEventsCubit, SeeAllEventsStates>(
              builder: (context, state) {
                if (state is LoadingSeeAllEventsState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessSeeAllEventsState) {
                  final events = state.events;

                  if (events.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: category.color.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              category.icon,
                              size: 80,
                              color: category.color.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'No ${category.name} events yet',
                            style: Styels.textStyleMedium20,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Check back later for new events',
                            style: Styels.textStyleRegular14.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: events.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return EventCard(event: events[index]);
                    },
                  );
                } else if (state is FailureSeeAllEventsState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 80,
                          color: Colors.red[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Something went wrong',
                          style: Styels.textStyleMedium18,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.errMessage,
                          style: Styels.textStyleRegular14.copyWith(
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
