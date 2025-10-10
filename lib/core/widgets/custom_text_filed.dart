import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool? isPassword;
  final Function(String?)? onSaved;
  final TextEditingController? controller;

  const CustomTextFiled({
    this.onSaved,
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword,
    this.controller,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColor.primary,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return " ";
        } else {
          return null;
        }
      },
      obscureText: (widget.isPassword ?? false) ? obscureText : false,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Color(0xFF807A7A)),
        hintText: widget.hintText,
        hintStyle: Styels.textStyleRegular14,
        fillColor: Color(0xFFE4DFDF),
        errorStyle: TextStyle(color: AppColor.errorColor, fontSize: 0),
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
                    color: Color(0xff979797),
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
