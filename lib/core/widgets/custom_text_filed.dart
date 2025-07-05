import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool? isPassword;

  const CustomTextFiled({
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
    return TextField(
      obscureText: (widget.isPassword ?? false) ? obscureText : false,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Color(0xFFE4DFDF)),
        hintText: widget.hintText,
        hintStyle: Styels.textStyle14,

        fillColor: Color(0xFFE4DFDF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFE4DFDF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFE4DFDF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFE4DFDF), width: 2),
        ),
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
}
