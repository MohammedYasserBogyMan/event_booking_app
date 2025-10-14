import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class ImageUploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Uploads an image to Firebase Storage and returns the download URL
  /// [imageFile] - The image file to upload
  /// [folder] - The folder in storage (e.g., 'profile_images', 'event_images')
  /// [userId] - Optional user ID to make the filename unique
  Future<String> uploadImage({
    required File imageFile,
    required String folder,
    String? userId,
  }) async {
    try {
      // Generate unique filename
      final String fileName = userId != null
          ? '${userId}_${DateTime.now().millisecondsSinceEpoch}${path.extension(imageFile.path)}'
          : '${DateTime.now().millisecondsSinceEpoch}${path.extension(imageFile.path)}';

      // Create reference to storage location
      final Reference storageRef = _storage.ref().child('$folder/$fileName');

      // Upload file
      final UploadTask uploadTask = storageRef.putFile(imageFile);

      // Wait for upload to complete and get download URL
      final TaskSnapshot snapshot = await uploadTask;
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: ${e.toString()}');
    }
  }

  /// Deletes an image from Firebase Storage using its URL
  /// [imageUrl] - The full download URL of the image
  Future<void> deleteImage(String imageUrl) async {
    try {
      // Only delete if it's a Firebase Storage URL
      if (imageUrl.contains('firebasestorage.googleapis.com')) {
        final Reference imageRef = _storage.refFromURL(imageUrl);
        await imageRef.delete();
      }
    } catch (e) {
      // Silently fail if image doesn't exist or can't be deleted
      // This is okay because we're just cleaning up
    }
  }

  /// Uploads a profile image for a specific user
  /// Automatically handles the folder structure
  Future<String> uploadProfileImage({
    required File imageFile,
    required String userId,
  }) async {
    return await uploadImage(
      imageFile: imageFile,
      folder: 'profile_images',
      userId: userId,
    );
  }

  /// Deletes old profile image and uploads new one
  /// Returns the new download URL
  Future<String> updateProfileImage({
    required File newImage,
    required String userId,
    String? oldImageUrl,
  }) async {
    // Upload new image first
    final String newImageUrl = await uploadProfileImage(
      imageFile: newImage,
      userId: userId,
    );

    // Delete old image if it exists and is not the default image
    if (oldImageUrl != null && oldImageUrl.contains('firebasestorage.googleapis.com')) {
      await deleteImage(oldImageUrl);
    }

    return newImageUrl;
  }
}
