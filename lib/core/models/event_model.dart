import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String imageUrl;
  final int going;
  final String publisherId;
  final int? maxAttendees;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.going,
    required this.publisherId,
    this.maxAttendees,
  });

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return EventModel(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      location: data['location'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      going: data['going'] ?? 0,
      publisherId: data['publisherId'] ?? '',
      maxAttendees: data['maxAttendees'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'date': Timestamp.fromDate(date),
      'location': location,
      'imageUrl': imageUrl,
      'going': going,
      'publisherId': publisherId,
      'maxAttendees': maxAttendees,
    };
  }
}
