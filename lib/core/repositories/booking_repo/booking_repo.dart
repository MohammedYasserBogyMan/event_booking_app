import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/models/booking_model.dart';
import 'package:event_booking_app/core/utils/errors.dart';

abstract class BookingRepo {
  Future<Either<Failure, BookingModel>> bookEvent({
    required String userId,
    required String eventId,
    required int price,
  });

  Future<Either<Failure, void>> cancelBooking({
    required String bookingId,
    required String eventId,
    required String userId,
  });

  Future<Either<Failure, BookingModel?>> getUserBookingForEvent({
    required String userId,
    required String eventId,
  });

  Future<Either<Failure, List<BookingModel>>> getUserBookings({
    required String userId,
  });

  Future<Either<Failure, List<BookingModel>>> getEventBookings({
    required String eventId,
  });

  Stream<QuerySnapshot> getUserBookingsStream({required String userId});
}
