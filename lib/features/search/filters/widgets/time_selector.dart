import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int selectedIndex = 1;

  final List<String> times = ["Today", "Tomorrow", "This week"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Time & Date", style: Styels.textStyle16),
        const SizedBox(height: 12),
        Row(
          children: List.generate(times.length, (index) {
            final isSelected = selectedIndex == index;
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(times[index], style: Styels.textStyle15),
                selected: isSelected,
                onSelected: (_) {
                  setState(() => selectedIndex = index);
                },
                selectedColor: AppColor.primary,

                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppColor.orTextColor,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Image.asset(AssetsData.dateIcon, height: 30),
                SizedBox(width: 13),
                Text("Choose from calendar", style: Styels.textStyle15),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColor.primary,
                  weight: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
