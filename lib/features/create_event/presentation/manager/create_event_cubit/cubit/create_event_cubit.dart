import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:event_booking_app/core/failure/errors.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  final EventsRepo repo;

  CreateEventCubit(this.repo) : super(CreateEventInitial());

  Future<void> createEvent(EventModel event) async {
    emit(CreateEventLoading());
    final Either<Failure, void> result = await repo.createEvent(event: event);

    result.fold(
      (failure) => emit(CreateEventFailure(failure.message)),
      (_) => emit(CreateEventSuccess()),
    );
  }

  Future<void> submitEvent({
    required String title,
    required String description,
    required String location,
    required String subLocation,
    required String category,
    required DateTime date,
    File? image,
    String? price,
    String? maxAttendees,
  }) async {
    emit(CreateEventLoading());

    try {
      final userId = FirebaseAuth.instance.currentUser?.uid ?? "unknown";
      String? imageUrl;

      if (image != null) {
        final ref = FirebaseStorage.instance.ref().child(
          "events/${DateTime.now().millisecondsSinceEpoch}.png",
        );

        await ref.putFile(image);
        imageUrl = await ref.getDownloadURL();
      }

      final event = EventModel(
        title: title,
        description: description,
        category: category,
        date: date,
        location: location,
        subLocation: subLocation,
        imageUrl: imageUrl ?? "",
        attendeeCount: 0,
        publisherId: userId,
        maxAttendees: int.tryParse(maxAttendees ?? "0"),
        price: int.tryParse(price ?? "0") ?? 0,
      );

      final result = await repo.createEvent(event: event);

      result.fold(
        (failure) => emit(CreateEventFailure(failure.message)),
        (_) => emit(CreateEventSuccess()),
      );
    } catch (e) {
      emit(CreateEventFailure(e.toString()));
    }
  }
}
