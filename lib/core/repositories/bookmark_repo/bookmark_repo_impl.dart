import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/repositories/bookmark_repo/bookmark_repo.dart';
import 'package:event_booking_app/core/utils/errors.dart';

class BookmarkRepoImpl implements BookmarkRepo {
  final FirebaseFirestore firestore;

  BookmarkRepoImpl(this.firestore);

  @override
  Future<Either<Failure, void>> addBookmark({
    required String userId,
    required String eventId,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('bookmarks')
          .doc(eventId)
          .set({
        'eventId': eventId,
        'timestamp': FieldValue.serverTimestamp(),
      });
      return right(null);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeBookmark({
    required String userId,
    required String eventId,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('bookmarks')
          .doc(eventId)
          .delete();
      return right(null);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isBookmarked({
    required String userId,
    required String eventId,
  }) async {
    try {
      final doc = await firestore
          .collection('users')
          .doc(userId)
          .collection('bookmarks')
          .doc(eventId)
          .get();
      return right(doc.exists);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Stream<QuerySnapshot> getUserBookmarks({required String userId}) {
    return firestore
        .collection('users')
        .doc(userId)
        .collection('bookmarks')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
