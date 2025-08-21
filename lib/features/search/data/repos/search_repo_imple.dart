import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/failure/errors.dart';
import 'package:event_booking_app/features/search/data/models/event_ui_model.dart';
import 'package:event_booking_app/features/search/data/repos/search_repo.dart';

class SearchRepoImple implements SearchRepo {
  final FirebaseFirestore _firestore;
  SearchRepoImple(this._firestore);
  @override
  Future<Either<Failure, List<EventUiModel>>> getSpecificEvents({
    required String targetSearch,
  }) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('events').get();
      List<EventUiModel> events = [];
      for (var event in snapshot.docs) {
        events.add(EventUiModel.fromFirestore(event));
      }
      return Right(events);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
