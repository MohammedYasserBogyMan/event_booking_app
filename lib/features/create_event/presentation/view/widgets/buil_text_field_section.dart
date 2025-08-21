import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class BuildTextFieldSection extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final TextEditingController subLocationController;
  final TextEditingController imageUrlController;
  final TextEditingController maxAttendeesController;
  final TextEditingController priceController;

  const BuildTextFieldSection({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.locationController,
    required this.subLocationController,
    required this.imageUrlController,
    required this.maxAttendeesController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    final fields = [
      {
        "icon": Icons.title,
        "hint": "Event Title",
        "controller": titleController,
      },
      {
        "icon": Icons.description,
        "hint": "Description",
        "controller": descriptionController,
      },
      {
        "icon": Icons.location_on,
        "hint": "Location",
        "controller": locationController,
      },
      {
        "icon": Icons.map,
        "hint": "Sub Location",
        "controller": subLocationController,
      },
      {
        "icon": Icons.image,
        "hint": "Image URL",
        "controller": imageUrlController,
      },
      {
        "icon": Icons.people,
        "hint": "Max Attendees",
        "controller": maxAttendeesController,
      },
      {
        "icon": Icons.attach_money,
        "hint": "Price",
        "controller": priceController,
      },
    ];

    return Column(
      children:
          fields
              .map(
                (f) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CustomTextFiled(
                    icon: f["icon"] as IconData,
                    hintText: f["hint"] as String,
                    controller: f["controller"] as TextEditingController,
                  ),
                ),
              )
              .toList(),
    );
  }
}
