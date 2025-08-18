import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final DateTime date;
  final String location;
  final String imageUrl;
  final int attendeeCount;
  final String publisherId;
  final int? maxAttendees;

  EventModel({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.attendeeCount,
    required this.publisherId,
    this.maxAttendees,
  });

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return EventModel(
      id: doc.id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      location: data['location'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      attendeeCount: data['going'] ?? 0,
      publisherId: data['publisherId'] ?? '',
      maxAttendees: data['maxAttendees'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'date': Timestamp.fromDate(date),
      'location': location,
      'imageUrl': imageUrl,
      'going': attendeeCount,
      'publisherId': publisherId,
      'maxAttendees': maxAttendees,
    };
  }
}
