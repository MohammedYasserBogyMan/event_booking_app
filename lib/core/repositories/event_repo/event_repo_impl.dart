import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/constants/cons.dart';
import 'package:event_booking_app/core/failure/errors.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';

class EventRepoImpl extends EventsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<EventModel>>> fetchAllEvents() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection(kCollectionReference).get();
      List<EventModel> events = [];
      for (var event in snapshot.docs) {
        events.add(EventModel.fromFirestore(event));
      }
      return Right(events);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventModel>>> fetchEventsByCategory({
    required String category,
  }) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore
              .collection(kCollectionReference)
              .where('category', isEqualTo: category)
              .get();
      List<EventModel> events = [];
      for (var event in snapshot.docs) {
        events.add(EventModel.fromFirestore(event));
      }
      return Right(events);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createEvent({
    required EventModel event,
  }) async {
    try {
      await _firestore
          .collection(kCollectionReference)
          .doc()
          .set(event.toFirestore());
      return const Right("Event created successfully");
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventModel>>> getEventsByIds(
    List<String> eventIds,
  ) async {
    try {
      if (eventIds.isEmpty) {
        return const Right([]);
      }

      List<EventModel> events = [];

      for (String eventId in eventIds) {
        final doc = await _firestore
            .collection(kCollectionReference)
            .doc(eventId)
            .get();

        if (doc.exists) {
          events.add(EventModel.fromFirestore(doc));
        }
      }

      return Right(events);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventModel>> getEventById(String eventId) async {
    try {
      final doc = await _firestore
          .collection(kCollectionReference)
          .doc(eventId)
          .get();

      if (!doc.exists) {
        return Left(Failure(message: 'Event not found'));
      }

      return Right(EventModel.fromFirestore(doc));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
