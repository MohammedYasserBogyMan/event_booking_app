import 'package:event_booking_app/core/failure/errors.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:dartz/dartz.dart';

abstract class EventsRepo {
  Future<Either<Failure, List<EventModel>>> fetchAllEvents();
  Future<Either<Failure, List<EventModel>>> fetchEventsByCategory({
    required String category,
  });
  Future<Either<Failure, String>> createEvent({required EventModel event});
  Future<Either<Failure, List<EventModel>>> getEventsByIds(List<String> eventIds);
  Future<Either<Failure, EventModel>> getEventById(String eventId);
}
