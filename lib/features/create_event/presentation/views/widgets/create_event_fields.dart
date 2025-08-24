import 'package:event_booking_app/core/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class CreateEventTextFields extends StatelessWidget {
  const CreateEventTextFields({super.key, required this.onSaved});
  final Function(Map<String, String?>) onSaved;
  @override
  Widget build(BuildContext context) {
    final Map<String, String?> values = {};
    final List<Map<String, dynamic>> fields = [
      {"key": "title", "icon": Icons.title, "hint": "Event Title"},
      {"key": "description", "icon": Icons.description, "hint": "Description"},
      {"key": "location", "icon": Icons.location_on, "hint": "Location"},
      {"key": "subLocation", "icon": Icons.map, "hint": "Sub Location"},
      {"key": "maxAttendees", "icon": Icons.people, "hint": "Max Attendees"},
      {"key": "price", "icon": Icons.attach_money, "hint": "Price"},
    ];
    return Column(
      children: fields.map((val) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CustomTextFiled(
            icon: val["icon"],
            hintText: val["hint"],
            onSaved: (input) {
              values[val["key"]] = input;
              if (val == fields.last) {
                onSaved(values);
              }
            },
          ),
        );
      }).toList(),
    );
  }
}
