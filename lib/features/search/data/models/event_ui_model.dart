import 'package:cloud_firestore/cloud_firestore.dart';

class EventUiModel {
  final String title;
  final String imageUrl;
  final DateTime day;
  EventUiModel({
    required this.imageUrl,
    required this.day,
    required this.title,
  });

  factory EventUiModel.fromFirestore(fromFireStore) {
    return EventUiModel(
      imageUrl: fromFireStore['imageUrl'] ?? '',
      title: fromFireStore['title'].toLowerCase() ?? '',
      day: (fromFireStore['date'] as Timestamp).toDate(),

      /// here from TimeStamp to date
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'title': title, 'day': Timestamp.fromDate(day)};

    /// here from date to TimeStamp
  }
}
