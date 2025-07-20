import 'package:event_booking_app/features/event_details/presentation/view/widget/toggel_item.dart';
import 'package:flutter/material.dart';

class EventToggleSwitch extends StatelessWidget {
  final bool isUpcomingSelected;
  final ValueChanged<bool> onToggle;

  const EventToggleSwitch({
    super.key,
    required this.isUpcomingSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: ToggleItem(
              text: 'UPCOMING',
              isSelected: isUpcomingSelected,
              onTap: () => onToggle(true),
            ),
          ),
          Expanded(
            child: ToggleItem(
              text: 'PAST EVENTS',
              isSelected: !isUpcomingSelected,
              onTap: () => onToggle(false),
            ),
          ),
        ],
      ),
    );
  }
}
