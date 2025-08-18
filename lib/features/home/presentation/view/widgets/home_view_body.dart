import 'package:event_booking_app/features/home/presentation/manager/home_cubit/cubit/home_cubit.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/home_header_with_category.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/event_section.dart';
import 'package:event_booking_app/features/home/presentation/view/widgets/invite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const double kSectionSpacing = 16.0;
  static const double kHeaderCategorySpacing = 60.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccess) {
          final events = state.events; // 👈 دي الليستة الجاية من Firestore

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: HomeHeaderWithCategory()),
              const SliverToBoxAdapter(
                child: SizedBox(height: kHeaderCategorySpacing),
              ),

              // Upcoming
              SliverToBoxAdapter(
                child: EventSection(title: 'Upcoming Events', events: events),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: kSectionSpacing),
              ),

              // Invite Card
              const SliverToBoxAdapter(child: InviteCard()),
              const SliverToBoxAdapter(
                child: SizedBox(height: kSectionSpacing),
              ),

              // Nearby
              SliverToBoxAdapter(
                child: EventSection(title: 'Nearby You', events: events),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: kSectionSpacing),
              ),
            ],
          );
        } else if (state is HomeFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
