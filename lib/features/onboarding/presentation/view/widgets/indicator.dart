import 'package:event_booking_app/features/onboarding/presentation/view/widgets/custom_dot.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.currentIndex,
    required this.goToPage,
  });
  final int currentIndex;
  final Function(int) goToPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => CustomDot(
          isActive: index == currentIndex ? true : false,
          onTap: () => index != currentIndex ? goToPage(index) : null,
        ),
      ),
    );
  }
}
