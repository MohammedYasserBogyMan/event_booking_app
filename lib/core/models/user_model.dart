import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;
  final String location; // City name (e.g., "Cairo, Egypt")
  final GeoPoint? locationCoordinates; // Geographic coordinates (lat, lng)
  final String about;
  final int followersCount;
  final int followingCount;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photoUrl,
    required this.location,
    this.locationCoordinates,
    required this.about,
    required this.followersCount,
    required this.followingCount,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? photoUrl,
    String? location,
    GeoPoint? locationCoordinates,
    String? about,
    int? followersCount,
    int? followingCount,
  }) {
    return UserModel(
      uid: uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      location: location ?? this.location,
      locationCoordinates: locationCoordinates ?? this.locationCoordinates,
      about: about ?? this.about,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
    );
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      location: data['location'] ?? '',
      locationCoordinates: data['locationCoordinates'] as GeoPoint?,
      about: data['about'] ?? '',
      followersCount: data['followersCount'] ?? 0,
      followingCount: data['followingCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'photoUrl': photoUrl,
      'location': location,
      'locationCoordinates': locationCoordinates,
      'about': about,
      'followersCount': followersCount,
      'followingCount': followingCount,
    };
  }

  String get fullName => '$firstName $lastName';
}
