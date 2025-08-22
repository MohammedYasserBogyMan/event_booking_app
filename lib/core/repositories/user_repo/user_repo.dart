// features/auth/data/repo/user_repo.dart
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/utils/errors.dart';
import 'package:event_booking_app/core/models/user_model.dart';

abstract class UserRepo {
  Future<Either<Failure, void>> createUserProfile(UserModel user);
  Future<Either<Failure, UserModel>> getUserByUid(String uid);
  Future<Either<Failure, void>> updateUser(UserModel user);
}
