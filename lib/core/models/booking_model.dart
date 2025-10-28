import 'package:cloud_firestore/cloud_firestore.dart';

enum BookingStatus {
  confirmed,
  cancelled,
  completed,
}

class BookingModel {
  final String id;
  final String userId;
  final String eventId;
  final DateTime bookingDate;
  final BookingStatus status;
  final String ticketNumber;
  final int price;

  BookingModel({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.bookingDate,
    required this.status,
    required this.ticketNumber,
    required this.price,
  });

  factory BookingModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return BookingModel(
      id: doc.id,
      userId: data['userId'] ?? '',
      eventId: data['eventId'] ?? '',
      bookingDate: (data['bookingDate'] as Timestamp).toDate(),
      status: BookingStatus.values.firstWhere(
        (e) => e.name == (data['status'] ?? 'confirmed'),
        orElse: () => BookingStatus.confirmed,
      ),
      ticketNumber: data['ticketNumber'] ?? '',
      price: data['price'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'eventId': eventId,
      'bookingDate': Timestamp.fromDate(bookingDate),
      'status': status.name,
      'ticketNumber': ticketNumber,
      'price': price,
    };
  }

  BookingModel copyWith({
    String? id,
    String? userId,
    String? eventId,
    DateTime? bookingDate,
    BookingStatus? status,
    String? ticketNumber,
    int? price,
  }) {
    return BookingModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      eventId: eventId ?? this.eventId,
      bookingDate: bookingDate ?? this.bookingDate,
      status: status ?? this.status,
      ticketNumber: ticketNumber ?? this.ticketNumber,
      price: price ?? this.price,
    );
  }

  static String generateTicketNumber() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return 'TKT-$timestamp-$random';
  }
}
