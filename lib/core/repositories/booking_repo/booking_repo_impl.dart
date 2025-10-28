import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/models/booking_model.dart';
import 'package:event_booking_app/core/repositories/booking_repo/booking_repo.dart';
import 'package:event_booking_app/core/utils/errors.dart';

class BookingRepoImpl implements BookingRepo {
  final FirebaseFirestore firestore;

  BookingRepoImpl(this.firestore);

  @override
  Future<Either<Failure, BookingModel>> bookEvent({
    required String userId,
    required String eventId,
    required int price,
  }) async {
    try {
      // Start a transaction to ensure data consistency
      final booking = await firestore.runTransaction<BookingModel>(
        (transaction) async {
          // Get event document
          final eventRef = firestore.collection('events').doc(eventId);
          final eventDoc = await transaction.get(eventRef);

          if (!eventDoc.exists) {
            throw Exception('Event not found');
          }

          final eventData = eventDoc.data()!;
          final attendeeCount = eventData['attendeeCount'] as int? ?? 0;
          final maxCapacity = eventData['maxCapacity'] as int? ?? 100;
          final attendeeIds = List<String>.from(eventData['attendeeIds'] ?? []);

          // Check if event is full
          if (attendeeCount >= maxCapacity) {
            throw Exception('Event is fully booked');
          }

          // Check if user already booked
          if (attendeeIds.contains(userId)) {
            throw Exception('You have already booked this event');
          }

          // Create booking
          final bookingRef = firestore.collection('bookings').doc();
          final newBooking = BookingModel(
            id: bookingRef.id,
            userId: userId,
            eventId: eventId,
            bookingDate: DateTime.now(),
            status: BookingStatus.confirmed,
            ticketNumber: BookingModel.generateTicketNumber(),
            price: price,
          );

          // Update event: increment attendeeCount and add userId to attendeeIds
          transaction.update(eventRef, {
            'attendeeCount': FieldValue.increment(1),
            'attendeeIds': FieldValue.arrayUnion([userId]),
          });

          // Create booking document
          transaction.set(bookingRef, newBooking.toFirestore());

          return newBooking;
        },
      );

      return right(booking);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelBooking({
    required String bookingId,
    required String eventId,
    required String userId,
  }) async {
    try {
      await firestore.runTransaction((transaction) async {
        // Get booking document
        final bookingRef = firestore.collection('bookings').doc(bookingId);
        final bookingDoc = await transaction.get(bookingRef);

        if (!bookingDoc.exists) {
          throw Exception('Booking not found');
        }

        // Get event document
        final eventRef = firestore.collection('events').doc(eventId);
        final eventDoc = await transaction.get(eventRef);

        if (!eventDoc.exists) {
          throw Exception('Event not found');
        }

        // Update booking status to cancelled
        transaction.update(bookingRef, {
          'status': BookingStatus.cancelled.name,
        });

        // Update event: decrement attendeeCount and remove userId from attendeeIds
        transaction.update(eventRef, {
          'attendeeCount': FieldValue.increment(-1),
          'attendeeIds': FieldValue.arrayRemove([userId]),
        });
      });

      return right(null);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingModel?>> getUserBookingForEvent({
    required String userId,
    required String eventId,
  }) async {
    try {
      final querySnapshot = await firestore
          .collection('bookings')
          .where('userId', isEqualTo: userId)
          .where('eventId', isEqualTo: eventId)
          .where('status', isEqualTo: BookingStatus.confirmed.name)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return right(null);
      }

      final booking = BookingModel.fromFirestore(querySnapshot.docs.first);
      return right(booking);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookingModel>>> getUserBookings({
    required String userId,
  }) async {
    try {
      final querySnapshot = await firestore
          .collection('bookings')
          .where('userId', isEqualTo: userId)
          .get();

      final bookings = querySnapshot.docs
          .map((doc) => BookingModel.fromFirestore(doc))
          .toList();

      // Sort in memory instead of using Firestore orderBy (to avoid index requirement)
      bookings.sort((a, b) => b.bookingDate.compareTo(a.bookingDate));

      return right(bookings);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookingModel>>> getEventBookings({
    required String eventId,
  }) async {
    try {
      final querySnapshot = await firestore
          .collection('bookings')
          .where('eventId', isEqualTo: eventId)
          .where('status', isEqualTo: BookingStatus.confirmed.name)
          .get();

      final bookings = querySnapshot.docs
          .map((doc) => BookingModel.fromFirestore(doc))
          .toList();

      // Sort in memory instead of using Firestore orderBy (to avoid index requirement)
      bookings.sort((a, b) => b.bookingDate.compareTo(a.bookingDate));

      return right(bookings);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Stream<QuerySnapshot> getUserBookingsStream({required String userId}) {
    return firestore
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }
}
