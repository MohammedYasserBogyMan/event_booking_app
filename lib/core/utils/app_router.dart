import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo_impl.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo_impl.dart';
import 'package:event_booking_app/features/create_event/presentation/views/create_event_view.dart';
import 'package:event_booking_app/features/event_details/presentation/view/event_details_view.dart';
import 'package:event_booking_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:event_booking_app/features/home/presentation/view/bookmark_view.dart';
import 'package:event_booking_app/features/home/presentation/view/calender_view.dart';
import 'package:event_booking_app/features/home/presentation/view/contact_us_view.dart';
import 'package:event_booking_app/features/home/presentation/view/helps_and_faqs_view.dart';
import 'package:event_booking_app/features/home/presentation/view/home_view.dart';
import 'package:event_booking_app/features/home/presentation/view/massage_view.dart';
import 'package:event_booking_app/features/home/presentation/view/settings_view.dart';
import 'package:event_booking_app/features/home/presentation/view/sign_out_view.dart';
import 'package:event_booking_app/features/my_profile/presentation/manager/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/edit_profile_view.dart';
import 'package:event_booking_app/features/my_profile/presentation/view/my_profile_view.dart';
import 'package:event_booking_app/features/notification/presentation/view/empty_notification_view.dart';
import 'package:event_booking_app/features/notification/presentation/view/notification_view.dart';
import 'package:event_booking_app/features/organizer_profile/presentation/view/organizer_profile_view.dart';
import 'package:event_booking_app/features/search/data/repos/search_repo_imple.dart';
import 'package:event_booking_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:event_booking_app/features/search/presentation/view/search_view.dart';
import 'package:event_booking_app/features/see_all_events/presentation/manager/see_all_events_cubit/see_all_events_cubit.dart';
import 'package:event_booking_app/features/see_all_events/presentation/view/see_all_events_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:event_booking_app/features/auth/presentation/view/login_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/register_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/resset_password_view.dart';
import 'package:event_booking_app/features/auth/presentation/view/verification_view.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:event_booking_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const splash = '/';
  static const kOnboarding = '/onboarding';
  static const kLogin = '/login';
  static const kRegister = '/register';
  static const kVerification = '/verification';
  static const kforgetpassword = '/forgetpassword';
  static const kHomeView = '/home';
  static const kEmptyNotification = '/empty_notification';
  static const kNotificationView = '/notification';
  static const kBookMarkView = '/bookmark';
  static const kCalenderView = '/calender';
  static const kContactUsView = '/contactus';
  static const kHelpAndFaqsView = '/help_and_faqs';
  static const kMassageView = '/massage';
  static const kSettingView = '/setting';
  static const kSignOutView = '/sign_out';
  static const kMyProfile = '/my_profile';
  static const kSeeAllEvents = '/see_all_events';
  static const kSearchView = '/search';
  static const kOrganizerProfile = '/organizer_profile';
  static const kEventDetailsView = "/event_details";
  static const kCreateEventView = "/create_eventt";
  static const kEditProfileView = "/edit_profile";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOrganizerProfile,
        builder: (context, state) {
          final organizerId = state.extra as String;
          return OrganizerProfileView(organizerId: organizerId);
        },
      ),
      GoRoute(
        path: kEventDetailsView,
        builder: (context, state) {
          final event = state.extra as EventModel;
          return EventDetailsView(event: event);
        },
      ),
      GoRoute(
        path: kNotificationView,
        builder: (context, state) => NotificationView(),
      ),
      GoRoute(
        path: kSearchView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      SearchCubit(SearchRepoImple(FirebaseFirestore.instance)),
              child: SearchView(),
            ),
      ),
      GoRoute(
        path: kSeeAllEvents,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      SeeAllEventsCubit(EventRepoImpl())..fetchEvents(),
              child: SeeAllEventsView(),
            ),
      ),
      GoRoute(path: kMyProfile, builder: (context, state) => MyProfileView()),
      GoRoute(path: kBookMarkView, builder: (context, state) => BookmarkView()),
      GoRoute(path: kCalenderView, builder: (context, state) => CalenderView()),
      GoRoute(
        path: kContactUsView,
        builder: (context, state) => ContactUsView(),
      ),
      GoRoute(
        path: kHelpAndFaqsView,
        builder: (context, state) => HelpsAndFaqsView(),
      ),
      GoRoute(path: kMassageView, builder: (context, state) => MassageView()),
      GoRoute(path: kSettingView, builder: (context, state) => SettingsView()),
      GoRoute(path: kSignOutView, builder: (context, state) => SignOutView()),
      GoRoute(path: splash, builder: (context, state) => SplashView()),
      GoRoute(path: kOnboarding, builder: (context, state) => OnboardingView()),
      GoRoute(path: kLogin, builder: (context, state) => LoginView()),
      GoRoute(path: kRegister, builder: (context, state) => RegisterView()),
      GoRoute(
        path: kforgetpassword,
        builder: (context, state) => RessetPasswordView(),
      ),
      GoRoute(
        path: kVerification,
        builder: (context, state) {
          final String email = state.extra as String;
          return VerificationView(email: email);
        },
      ),
      GoRoute(
        path: kEmptyNotification,
        builder: (context, state) => EmptyNotificationView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HomeCubit(EventRepoImpl())..getAllEvents(),
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) =>
                    EditProfileCubit(UserRepoImpl(FirebaseFirestore.instance)),
            child: EditProfileView(user: state.extra as dynamic),
          );
        },
      ),
      GoRoute(
        path: kCreateEventView,
        builder: (context, state) {
          return CreateEventView();
        },
      ),
    ],
  );
}
