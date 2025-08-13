import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool? isPassword;
  final Function(String?)? onSaved;


  const CustomTextFiled({
    this.onSaved,
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primary,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field is required";
        } else {
          return null;
        }
      },
      obscureText: (widget.isPassword ?? false) ? obscureText : false,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Color(0xFFE4DFDF)),
        hintText: widget.hintText,
        hintStyle: Styels.textStyle14,
        fillColor: Color(0xFFE4DFDF),
        errorStyle: TextStyle(color: AppColor.errorColor),
        border: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(color: AppColor.errorColor),
        focusedErrorBorder: _buildOutlineInputBorder(
          color: AppColor.errorColor,
        ),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        suffixIcon:
            widget.isPassword == true
                ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
                : null,
      ),
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
