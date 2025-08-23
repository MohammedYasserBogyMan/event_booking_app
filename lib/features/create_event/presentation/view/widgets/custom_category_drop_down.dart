import 'package:flutter/material.dart';

class CustomCategoryDropDown extends StatelessWidget {
  final String? value;
  final void Function(String?) onChanged;

  const CustomCategoryDropDown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Technology",
      "Sports",
      "Music",
      "Education",
      "Health",
    ];

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.category),
        border: OutlineInputBorder(),
        hintText: "Select Category",
      ),
      value: value,
      items:
          categories
              .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
              .toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? "Please select a category" : null,
    );
  }
}
