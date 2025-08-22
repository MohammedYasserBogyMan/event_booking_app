import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:meta/meta.dart';

part 'publisher_state.dart';

class PublisherCubit extends Cubit<PublisherState> {
  PublisherCubit(this.userRepo) : super(PublisherInitial());

  final UserRepo userRepo;

  Future<void> getPublisher(String uid) async {
    emit(PublisherLoading());
    final result = await userRepo.getUserByUid(uid);

    result.fold(
      (failure) => emit(PublisherFailure(failure.errMessage)),
      (user) => emit(PublisherSuccess(user)),
    );
  }
}
