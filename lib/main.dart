import 'package:device_preview/device_preview.dart';
import 'package:event_booking_app/core/di/service_locator.dart';
import 'package:event_booking_app/core/repositories/bookmark_repo/bookmark_repo.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/theme/app_theme.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/bookmarks/presentation/manager/bookmark_cubit/bookmark_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/firebase_options.dart';
import 'package:event_booking_app/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/shared_prefs_service.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsService.I.init();
  await setupServiceLocator();
  runApp(DevicePreview(enabled: !true, builder: (context) => EventBooking()));
}

class EventBooking extends StatelessWidget {
  const EventBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt<AuthRepo>(), getIt<UserRepo>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  CurrentUserCubit(getIt<UserRepo>(), getIt<AuthRepo>())
                    ..fetchCurrentUserInfo(),
        ),
        BlocProvider(
          create:
              (context) => BookmarkCubit(
                bookmarkRepo: getIt<BookmarkRepo>(),
                eventRepo: getIt<EventsRepo>(),
              ),
        ),
      ],
      child: MaterialApp.router(
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
