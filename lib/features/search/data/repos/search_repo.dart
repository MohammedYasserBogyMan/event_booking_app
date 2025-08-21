import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/failure/errors.dart';
import 'package:event_booking_app/features/search/data/models/event_ui_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<EventUiModel>>> getSpecificEvents({
    required String targetSearch,
  });
}
