import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key, this.onSaved});
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 55,
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return " ";
          }
          return null;
        },
        cursorColor: AppColor.primary,
        onChanged: (value) {
          if (value.length == 1) {
            goToNextFocus(context);
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedErrorBorder: buildBorder(color: Colors.red),
          errorBorder: buildBorder(color: Colors.red),
          enabledBorder: buildBorder(color: AppColor.primary),
          focusedBorder: buildBorder(color: AppColor.primary),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color),
    );
  }
}
