import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String title;
  final String category;
  final String description;
  final DateTime date;
  final String location;
  final String subLocation;
  final String imageUrl;
  final int attendeeCount;
  final String publisherId;
  final int price;

  EventModel({
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.subLocation,
    required this.imageUrl,
    required this.attendeeCount,
    required this.publisherId,
    required this.price,
  });

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return EventModel(
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      location: data['location'] ?? '',
      subLocation: data['subLocation'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      attendeeCount: data['attendeeCount'] ?? 0,
      publisherId: data['publisherId'] ?? '',
      price: data['price'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'category': category,
      'description': description,
      'date': Timestamp.fromDate(date),
      'location': location,
      'subLocation': subLocation,
      'imageUrl': imageUrl,
      'attendeeCount': attendeeCount,
      'publisherId': publisherId,
      'price': price,
    };
  }
}
