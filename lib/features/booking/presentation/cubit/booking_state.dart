import 'package:event_booking_app/core/models/booking_model.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final BookingModel booking;

  BookingSuccess(this.booking);
}

class BookingCancelled extends BookingState {}

class BookingError extends BookingState {
  final String message;

  BookingError(this.message);
}

class BookingsLoaded extends BookingState {
  final List<BookingModel> bookings;

  BookingsLoaded(this.bookings);
}

class CheckingBookingStatus extends BookingState {}

class BookingStatusChecked extends BookingState {
  final bool isBooked;
  final BookingModel? booking;

  BookingStatusChecked({required this.isBooked, this.booking});
}
