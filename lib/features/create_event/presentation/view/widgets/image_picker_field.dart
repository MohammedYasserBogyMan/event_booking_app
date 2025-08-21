import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ImagePickerField extends StatefulWidget {
  const ImagePickerField({super.key});

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  final ImagePicker picker = ImagePicker();
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            backgroundColor: Colors.white,
            foregroundColor: AppColor.primary,
          ),
          onPressed: _pickImage,
          child: Text(
            "Choose Photo",
            style: Styels.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (_fileName != null)
          Text("File Name: $_fileName", style: Styels.textStyle14),
      ],
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _fileName = path.basename(pickedFile.path);
      });
    }
  }
}
