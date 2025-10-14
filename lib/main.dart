import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/core/repositories/bookmark_repo/bookmark_repo_impl.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo_impl.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo_impl.dart';
import 'package:event_booking_app/core/theme/app_theme.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo_imple.dart';
import 'package:event_booking_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:event_booking_app/features/bookmarks/presentation/manager/bookmark_cubit/bookmark_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/firebase_options.dart';
import 'package:event_booking_app/simple_bloc_observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/shared_prefs_service.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsService.I.init();
  runApp(EventBooking());
}

class EventBooking extends StatelessWidget {
  const EventBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AuthCubit(
                AuthRepoImple(FirebaseAuth.instance),
                UserRepoImpl(FirebaseFirestore.instance),
              ),
        ),
        BlocProvider(
          create:
              (context) => CurrentUserCubit(
                UserRepoImpl(FirebaseFirestore.instance),
                AuthRepoImple(FirebaseAuth.instance),
              )..fetchCurrentUserInfo(),
        ),
        BlocProvider(
          create:
              (context) => BookmarkCubit(
                bookmarkRepo: BookmarkRepoImpl(FirebaseFirestore.instance),
                eventRepo: EventRepoImpl(),
              ),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
