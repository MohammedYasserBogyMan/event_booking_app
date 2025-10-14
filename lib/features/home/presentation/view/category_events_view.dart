import 'package:event_booking_app/core/repositories/event_repo/event_repo_impl.dart';
import 'package:event_booking_app/features/home/data/model/category_tap_model.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/category_events_view_body.dart';
import 'package:event_booking_app/features/see_all_events/presentation/manager/see_all_events_cubit/see_all_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryEventsView extends StatelessWidget {
  final CategoryModel category;
  const CategoryEventsView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeeAllEventsCubit(EventRepoImpl())
          ..fetchEventsByCategory(category.name),
      child: Scaffold(
        body: CategoryEventsViewBody(category: category),
      ),
    );
  }
}
