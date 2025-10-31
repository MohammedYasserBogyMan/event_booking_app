import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/core/repositories/bookmark_repo/bookmark_repo.dart';
import 'package:event_booking_app/core/repositories/bookmark_repo/bookmark_repo_impl.dart';
import 'package:event_booking_app/core/repositories/booking_repo/booking_repo.dart';
import 'package:event_booking_app/core/repositories/booking_repo/booking_repo_impl.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo_impl.dart';
import 'package:event_booking_app/core/repositories/follow_repo/follow_repo.dart';
import 'package:event_booking_app/core/repositories/follow_repo/follow_repo_impl.dart';
import 'package:event_booking_app/core/repositories/messaging_repo/messaging_repo.dart';
import 'package:event_booking_app/core/repositories/messaging_repo/messaging_repo_impl.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo_impl.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo.dart';
import 'package:event_booking_app/features/auth/data/repos/auth_repo_imple.dart';
import 'package:event_booking_app/features/notification/data/repositories/notification_repo.dart';
import 'package:event_booking_app/features/notification/data/repositories/notification_repo_impl.dart';
import 'package:event_booking_app/features/search/data/repos/search_repo.dart';
import 'package:event_booking_app/features/search/data/repos/search_repo_imple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Firebase instances (singletons by default)
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Auth Repository
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImple(getIt<FirebaseAuth>()),
  );

  // User Repository
  getIt.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(getIt<FirebaseFirestore>()),
  );

  // Event Repository
  getIt.registerLazySingleton<EventsRepo>(
    () => EventRepoImpl(getIt<FirebaseFirestore>()),
  );

  // Bookmark Repository
  getIt.registerLazySingleton<BookmarkRepo>(
    () => BookmarkRepoImpl(getIt<FirebaseFirestore>()),
  );

  // Search Repository
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImple(getIt<FirebaseFirestore>()),
  );

  // Booking Repository
  getIt.registerLazySingleton<BookingRepo>(
    () => BookingRepoImpl(getIt<FirebaseFirestore>()),
  );

  // Follow Repository
  getIt.registerLazySingleton<FollowRepo>(
    () => FollowRepoImpl(firestore: getIt<FirebaseFirestore>()),
  );

  // Messaging Repository
  getIt.registerLazySingleton<MessagingRepo>(
    () => MessagingRepoImpl(firestore: getIt<FirebaseFirestore>()),
  );

  // Notification Repository
  getIt.registerLazySingleton<NotificationRepo>(
    () => NotificationRepoImpl(firestore: getIt<FirebaseFirestore>()),
  );
}
