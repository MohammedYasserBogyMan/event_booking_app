import 'package:cloud_firestore/cloud_firestore.dart';

class EventUiModel {
  final String title;
  final DateTime day;
  EventUiModel({required this.day, required this.title});

  factory EventUiModel.fromFirestore(fromFireStore) {
    return EventUiModel(
      title: fromFireStore['title'] ?? '',
      day: (fromFireStore['date'] as Timestamp).toDate(),

      /// here from TimeStamp to date
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'title': title, 'day': Timestamp.fromDate(day)};

    /// here from date to TimeStamp
  }
}
