import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
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
      "Tech",
      "Sports",
      "Education",
      "Health",
      "Music",
    ];
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      style: Styels.textStyleMedium16,
      icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF807A7A)),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.category, color: Color(0xFF807A7A)),
        hintText: "Select Category",
        hintStyle: Styels.textStyleRegular14,
        fillColor: Color(0xFFE4DFDF),
        errorStyle: TextStyle(color: AppColor.errorColor, fontSize: 0),
        border: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(color: AppColor.errorColor),
        focusedErrorBorder: _buildOutlineInputBorder(color: AppColor.errorColor),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(color: AppColor.primary),
      ),
      validator: (value) {
        if (value == null) {
          return " ";
        }
        return null;
      },
      items: categories.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category),
        );
      }).toList(),
      value: value,
      onChanged: onChanged,
    );
  }

  OutlineInputBorder _buildOutlineInputBorder({
    Color color = const Color(0xFFE4DFDF),
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
