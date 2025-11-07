import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    String? attendeesCount,
    String? maxCapacity,
    GeoPoint? locationCoordinates,
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
        id: '',
        title: title,
        description: description,
        category: category,
        date: date,
        location: location,
        subLocation: subLocation,
        locationCoordinates: locationCoordinates,
        imageUrl: imageUrl ?? "",
        attendeeCount: int.tryParse(attendeesCount ?? "0") ?? 0,
        maxCapacity: int.tryParse(maxCapacity ?? "100") ?? 100,
        attendeeIds: [],
        publisherId: userId,
        price: int.tryParse(price ?? "0") ?? 0,
        searchTermsArray: _generateSearchTerms(title),
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

  List<String> _generateSearchTerms(String title) {
    final words = title.toLowerCase().split(" ");
    List<String> keywords = [];

    for (var word in words) {
      // إضافة كل أجزاء الكلمة
      for (int i = 1; i <= word.length; i++) {
        keywords.add(word.substring(0, i));
      }
    }

    // إضافة العنوان كله (للبحث بالكلمة كاملة)
    keywords.add(title.toLowerCase());

    // إزالة التكرارات
    return keywords.toSet().toList();
  }
}
