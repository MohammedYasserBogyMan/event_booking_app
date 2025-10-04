// features/auth/data/repo/user_repo_impl.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:event_booking_app/core/constants/cons.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/utils/errors.dart';
import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  final FirebaseFirestore firestore;
  UserRepoImpl(this.firestore);

  @override
  Future<Either<Failure, void>> createUserProfile(UserModel user) async {
    try {
      // نخزن doc id = uid عشان يبقى سهل الاستعلام
      await firestore.collection(kUserCollection).doc(user.uid).set(user.toMap());
      return Right(null);
    } catch (e) {
      return Left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserByUid(String uid) async {
    try {
      final doc = await firestore.collection(kUserCollection).doc(uid).get();
      if (!doc.exists) {
        return Left(FirebaseAuthFailure(errMessage: 'User not found'));
      }
      return Right(UserModel.fromFirestore(doc));
    } catch (e) {
      return Left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserModel user) async {
    try {
      await firestore.collection(kUserCollection).doc(user.uid).update(user.toMap());
      return right(null);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: e.toString()));
    }
  }
}
