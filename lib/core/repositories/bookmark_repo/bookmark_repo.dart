import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/utils/errors.dart';

abstract class BookmarkRepo {
  Future<Either<Failure, void>> addBookmark({
    required String userId,
    required String eventId,
  });

  Future<Either<Failure, void>> removeBookmark({
    required String userId,
    required String eventId,
  });

  Future<Either<Failure, bool>> isBookmarked({
    required String userId,
    required String eventId,
  });

  Stream<QuerySnapshot> getUserBookmarks({required String userId});
}
