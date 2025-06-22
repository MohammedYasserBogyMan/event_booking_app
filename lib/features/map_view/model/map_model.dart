import 'package:equatable/equatable.dart';

class MapModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final DateTime date;
  final double latitude;
  final double longitude;
  final String imageUrl;

  const MapModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
  });

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      date: DateTime.parse(json['date']),
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'date': date.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'image_url': imageUrl,
    };
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    date,
    latitude,
    longitude,
    imageUrl,
  ];
}

/*
  supabase table:
- id: int (primary key)
- title: text
- description: text
- category: text (مثلاً: music, sport)
- date: timestamp
- latitude: float
- longitude: float
- image_url: text

   */
