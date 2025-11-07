import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final DateTime? date;
  final Function(DateTime) onDateSelected;

  const DatePickerField({
    super.key,
    required this.date,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd/MM/yyyy");

    return InkWell(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColor.primary,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) onDateSelected(pickedDate);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.date_range, color: Color(0xFF807A7A)),
          hintText: "Select Date",
          hintStyle: Styels.textStyleRegular14,
          fillColor: Color(0xFFE4DFDF),
          border: _buildOutlineInputBorder(),
          enabledBorder: _buildOutlineInputBorder(),
          focusedBorder: _buildOutlineInputBorder(color: AppColor.primary),
        ),
        child: Text(
          date == null ? "Choose date" : dateFormat.format(date!),
          style: date == null
              ? Styels.textStyleRegular14.copyWith(color: Color(0xff747688))
              : Styels.textStyleMedium16,
        ),
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
