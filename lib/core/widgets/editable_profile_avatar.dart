import 'dart:io';
import 'package:event_booking_app/core/services/image_cache_manager.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditableProfileAvatar extends StatelessWidget {
  const EditableProfileAvatar({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.onImageSelected,
    this.isEditable = false,
  });

  final String imageUrl;
  final double radius;
  final Function(File)? onImageSelected;
  final bool isEditable;

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    // Show bottom sheet with options
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a Photo'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );

    if (source != null) {
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 70,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null && onImageSelected != null) {
        onImageSelected!(File(image.path));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageUrl.startsWith('http')
            ? ImageCacheManager.buildCachedCircleAvatar(
                imageUrl: imageUrl,
                radius: radius,
              )
            : CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: radius,
                backgroundImage: AssetImage(
                  AssetsData.defaultPhotoForNewUser,
                ) as ImageProvider,
              ),
        if (isEditable)
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _pickImage(context),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: radius * 0.3,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
