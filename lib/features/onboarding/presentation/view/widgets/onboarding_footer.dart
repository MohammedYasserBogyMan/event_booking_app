import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'indecator.dart';

class OnboardingFooter extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingFooter({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onSkip,
            child: Text(
              currentPage == pageCount - 1 ? '' : 'Skip',
              style: Styels.textStyle18.copyWith(
                color: Colors.white.withAlpha(150),
              ),
            ),
          ),
          Indecator(currentPage: currentPage, pageCount: pageCount),
          TextButton(
            onPressed: onNext,
            child: Text(
              currentPage == pageCount - 1 ? 'Start' : 'Next',
              style: Styels.textStyle18,
            ),
          ),
        ],
      ),
    );
  }
}
