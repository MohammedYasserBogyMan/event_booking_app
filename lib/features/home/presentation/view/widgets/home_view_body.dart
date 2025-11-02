import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_header_with_category.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/custom_invite_card.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/near_by_you_events.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/upcoming_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const double kSectionSpacing = 16;
  static const double kHeaderCategorySpacing = 20;

  Future<void> _onRefresh(BuildContext context) async {
    await context.read<HomeCubit>().getAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator(color: AppColor.primary,));
        } else if (state is HomeSuccess) {
          final events = state.events;

          return RefreshIndicator(
            color: AppColor.primary,
            onRefresh: () => _onRefresh(context),
            child: CustomScrollView(
              slivers: [
                // home header
                const SliverToBoxAdapter(child: HomeHeaderWithCategory()),
                const SliverToBoxAdapter(
                  child: SizedBox(height: kHeaderCategorySpacing),
                ),

                // Upcoming
                SliverToBoxAdapter(child: UpcomingEvents(events: events)),

                const SliverToBoxAdapter(
                  child: SizedBox(height: kSectionSpacing),
                ),

                // Invite Card
                const SliverToBoxAdapter(child: CustomInviteCard()),
                const SliverToBoxAdapter(
                  child: SizedBox(height: kSectionSpacing),
                ),

                // Nearby
                SliverToBoxAdapter(child: NearbyYouEvents(events: events)),
                const SliverToBoxAdapter(child: SizedBox(height: 25)),
              ],
            ),
          );
        } else if (state is HomeFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
