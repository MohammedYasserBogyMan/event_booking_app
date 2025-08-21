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
          initialDate: DateTime.now(),
          firstDate: DateTime(2024),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) onDateSelected(pickedDate);
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.date_range),
          border: OutlineInputBorder(),
          hintText: "Select Date",
        ),
        child: Text(
          date == null ? "Choose date" : dateFormat.format(date!),
          style: TextStyle(color: date == null ? Colors.grey : Colors.black),
        ),
      ),
    );
  }
}
