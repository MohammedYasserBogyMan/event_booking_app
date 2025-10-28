import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_booking_app/core/repositories/booking_repo/booking_repo.dart';
import 'package:event_booking_app/features/booking/presentation/cubit/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepo bookingRepo;

  BookingCubit(this.bookingRepo) : super(BookingInitial());

  Future<void> bookEvent({
    required String userId,
    required String eventId,
    required int price,
  }) async {
    emit(BookingLoading());

    final result = await bookingRepo.bookEvent(
      userId: userId,
      eventId: eventId,
      price: price,
    );

    result.fold(
      (failure) => emit(BookingError(failure.errMessage)),
      (booking) => emit(BookingSuccess(booking)),
    );
  }

  Future<void> cancelBooking({
    required String bookingId,
    required String eventId,
    required String userId,
  }) async {
    emit(BookingLoading());

    final result = await bookingRepo.cancelBooking(
      bookingId: bookingId,
      eventId: eventId,
      userId: userId,
    );

    result.fold(
      (failure) => emit(BookingError(failure.errMessage)),
      (_) => emit(BookingCancelled()),
    );
  }

  Future<void> getUserBookings({required String userId}) async {
    emit(BookingLoading());

    final result = await bookingRepo.getUserBookings(userId: userId);

    result.fold(
      (failure) => emit(BookingError(failure.errMessage)),
      (bookings) => emit(BookingsLoaded(bookings)),
    );
  }

  Future<void> checkBookingStatus({
    required String userId,
    required String eventId,
  }) async {
    emit(CheckingBookingStatus());

    final result = await bookingRepo.getUserBookingForEvent(
      userId: userId,
      eventId: eventId,
    );

    result.fold(
      (failure) => emit(BookingError(failure.errMessage)),
      (booking) => emit(BookingStatusChecked(
        isBooked: booking != null,
        booking: booking,
      )),
    );
  }

  void reset() {
    emit(BookingInitial());
  }
}
