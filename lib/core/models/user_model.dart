import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;
  final String location;
  final String about;
  final int followersCount;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photoUrl,
    required this.location,
    required this.about,
    required this.followersCount,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? photoUrl,
    String? location,
    String? about,
    int? followersCount,
  }) {
    return UserModel(
      uid: uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      location: location ?? this.location,
      about: about ?? this.about,
      followersCount: followersCount ?? this.followersCount,
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
      about: data['about'] ?? '',
      followersCount: data['followersCount'] ?? 0,
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
      'about': about,
      'followersCount': followersCount,
    };
  }

  String get fullName => '$firstName $lastName';
}
