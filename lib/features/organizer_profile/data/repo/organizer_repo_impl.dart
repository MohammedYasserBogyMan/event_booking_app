// organizer_repo_impl.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/errors.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'organizer_repo.dart';

class OrganizerRepoImpl implements OrganizerRepo {
  final FirebaseFirestore firestore;
  OrganizerRepoImpl(this.firestore);

  @override
  Future<Either<Failure, List<EventModel>>> fetchOrganizerEvents(
    String organizerId,
  ) async {
    try {
      final snapshot =
          await firestore
              .collection("events")
              .where("publisherId", isEqualTo: organizerId)
              .get();

      final events =
          snapshot.docs.map((doc) => EventModel.fromFirestore(doc)).toList();
      return Right(events);
    } catch (e) {
      return Left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchOrganizerProfileData(
    String organizerId,
  ) async {
    try {
      final query =
          await firestore
              .collection('users')
              .where('uid', isEqualTo: organizerId)
              .limit(1)
              .get();

      if (query.docs.isEmpty) {
        return Left(FirebaseAuthFailure(errMessage: "Organizer not found"));
      }

      final profileData = UserModel.fromFirestore(query.docs.first);
      return Right(profileData);
    } catch (e) {
      return Left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }
}
