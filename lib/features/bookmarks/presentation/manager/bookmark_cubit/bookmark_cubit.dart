import 'package:bloc/bloc.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/repositories/bookmark_repo/bookmark_repo.dart';
import 'package:event_booking_app/core/repositories/event_repo/event_repo.dart';
import 'package:meta/meta.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final BookmarkRepo bookmarkRepo;
  final EventsRepo eventRepo;

  BookmarkCubit({
    required this.bookmarkRepo,
    required this.eventRepo,
  }) : super(BookmarkInitial());

  final Map<String, bool> _bookmarkStatus = {};

  Future<void> toggleBookmark({
    required String userId,
    required String eventId,
  }) async {
    final currentStatus = _bookmarkStatus[eventId] ?? false;

    if (currentStatus) {
      await removeBookmark(userId: userId, eventId: eventId);
    } else {
      await addBookmark(userId: userId, eventId: eventId);
    }
  }

  Future<void> addBookmark({
    required String userId,
    required String eventId,
  }) async {
    final result = await bookmarkRepo.addBookmark(
      userId: userId,
      eventId: eventId,
    );

    result.fold(
      (failure) => emit(BookmarkFailure(failure.errMessage)),
      (_) {
        _bookmarkStatus[eventId] = true;
        emit(BookmarkStatusChanged(true));
      },
    );
  }

  Future<void> removeBookmark({
    required String userId,
    required String eventId,
  }) async {
    final result = await bookmarkRepo.removeBookmark(
      userId: userId,
      eventId: eventId,
    );

    result.fold(
      (failure) => emit(BookmarkFailure(failure.errMessage)),
      (_) {
        _bookmarkStatus[eventId] = false;
        emit(BookmarkStatusChanged(false));
      },
    );
  }

  Future<void> checkBookmarkStatus({
    required String userId,
    required String eventId,
  }) async {
    final result = await bookmarkRepo.isBookmarked(
      userId: userId,
      eventId: eventId,
    );

    result.fold(
      (failure) {},
      (isBookmarked) {
        _bookmarkStatus[eventId] = isBookmarked;
      },
    );
  }

  bool isEventBookmarked(String eventId) {
    return _bookmarkStatus[eventId] ?? false;
  }

  Stream<List<EventModel>> getBookmarkedEvents({required String userId}) async* {
    await for (final bookmarksSnapshot in bookmarkRepo.getUserBookmarks(userId: userId)) {
      if (bookmarksSnapshot.docs.isEmpty) {
        yield [];
        continue;
      }

      final eventIds = bookmarksSnapshot.docs
          .map((doc) => doc['eventId'] as String)
          .toList();

      for (final eventId in eventIds) {
        _bookmarkStatus[eventId] = true;
      }

      final eventsResult = await eventRepo.getEventsByIds(eventIds);

      yield eventsResult.fold(
        (failure) => [],
        (events) => events,
      );
    }
  }
}
