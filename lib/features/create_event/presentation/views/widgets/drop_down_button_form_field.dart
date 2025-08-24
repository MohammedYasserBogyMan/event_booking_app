import 'package:flutter/material.dart';

class DropDownButtonFormField extends StatelessWidget {
  const DropDownButtonFormField({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final String? value;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Technology",
      "Sports",
      "Education",
      "Health",
      "Music",
    ];
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.category),
        border: OutlineInputBorder(),
        helperText: " ",
        hintText: "Select Category",
      ),
      validator: (value) {
        if (value == null) {
          return " ";
        }
        return null;
      },
      items:
          categories.map((category) {
            return DropdownMenuItem(value: category, child: Text(category));
          }).toList(),
      value: value,
      onChanged: onChanged,
    );
  }
}
