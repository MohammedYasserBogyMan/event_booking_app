import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final DateTime date;
  final String location;
  final String subLocation;
  final String imageUrl;
  final int attendeeCount;
  final int maxCapacity;
  final List<String> attendeeIds;
  final String publisherId;
  final int price;
  final List<String> searchTermsArray;

  EventModel({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.subLocation,
    required this.imageUrl,
    required this.attendeeCount,
    required this.maxCapacity,
    required this.attendeeIds,
    required this.publisherId,
    required this.price,
    required this.searchTermsArray,
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
      subLocation: data['subLocation'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      attendeeCount: data['attendeeCount'] ?? 0,
      maxCapacity: data['maxCapacity'] ?? 100,
      attendeeIds: List<String>.from(
        data['attendeeIds'] ?? [],
      ),
      publisherId: data['publisherId'] ?? '',
      price: data['price'] ?? 0,
      searchTermsArray: List<String>.from(
        data['searchTermsArray'] ?? [],
      ),
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
      'maxCapacity': maxCapacity,
      'attendeeIds': attendeeIds,
      'publisherId': publisherId,
      'price': price,
      'searchTermsArray': searchTermsArray,
    };
  }

  bool get isFull => attendeeCount >= maxCapacity;

  bool isUserAttending(String userId) => attendeeIds.contains(userId);

  EventModel copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    DateTime? date,
    String? location,
    String? subLocation,
    String? imageUrl,
    int? attendeeCount,
    int? maxCapacity,
    List<String>? attendeeIds,
    String? publisherId,
    int? price,
    List<String>? searchTermsArray,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      date: date ?? this.date,
      location: location ?? this.location,
      subLocation: subLocation ?? this.subLocation,
      imageUrl: imageUrl ?? this.imageUrl,
      attendeeCount: attendeeCount ?? this.attendeeCount,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      attendeeIds: attendeeIds ?? this.attendeeIds,
      publisherId: publisherId ?? this.publisherId,
      price: price ?? this.price,
      searchTermsArray: searchTermsArray ?? this.searchTermsArray,
    );
  }
}
