import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/utils/errors.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> register({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> resetPassword({required String email});
  Future<Either<Failure, String>> getCurrentUserId();
  Future<Either<Failure, void>> signOut();
}
