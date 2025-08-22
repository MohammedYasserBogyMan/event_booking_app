// organizer_repo.dart
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/errors.dart';
import 'package:event_booking_app/core/models/user_model.dart';

abstract class OrganizerRepo {
  Future<Either<Failure, List<EventModel>>> fetchOrganizerEvents(
    String organizerId,
  );
  Future<Either<Failure, UserModel>> fetchOrganizerProfileData(
    String organizerId,
  );
}
