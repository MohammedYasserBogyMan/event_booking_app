import 'package:event_booking_app/core/repositories/event_repo_impl.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/manager/events_cubit/events_tap_cubit.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/organizer_profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrganizerProfileProviders {
  static MultiBlocProvider organizerProfile = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => EventsTabCubit(EventRepoImpl())..getEvents(),
      ),
    ],
    child: OrganizerProfileView(),
  );
}
