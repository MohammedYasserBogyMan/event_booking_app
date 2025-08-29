import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/constants/cons.dart';
import 'package:event_booking_app/core/failure/errors.dart';
import 'package:event_booking_app/features/search/data/models/event_ui_model.dart';
import 'package:event_booking_app/features/search/data/repos/search_repo.dart';

class SearchRepoImple implements SearchRepo {
  final FirebaseFirestore _firestore;
  SearchRepoImple(this._firestore);

  @override
  Future<Either<Failure, List<EventUiModel>>> getSpecificEventsByTitel({
    required String targetSearch,
  }) async {
    try {
      final searchLower = targetSearch.toLowerCase();

      final snapshot =
          await _firestore
              .collection(kCollectionReference)
              .where("searchTermsArray", arrayContains: searchLower)
              .get();

      final events =
          snapshot.docs.map((doc) => EventUiModel.fromFirestore(doc)).toList();

      return Right(events);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
