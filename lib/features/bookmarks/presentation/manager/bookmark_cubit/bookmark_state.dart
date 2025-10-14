part of 'bookmark_cubit.dart';

@immutable
sealed class BookmarkState {}

final class BookmarkInitial extends BookmarkState {}

final class BookmarkLoading extends BookmarkState {}

final class BookmarkSuccess extends BookmarkState {}

final class BookmarkFailure extends BookmarkState {
  final String errMessage;
  BookmarkFailure(this.errMessage);
}

final class BookmarkStatusChanged extends BookmarkState {
  final bool isBookmarked;
  BookmarkStatusChanged(this.isBookmarked);
}
