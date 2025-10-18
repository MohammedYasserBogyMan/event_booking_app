import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/onboarding_list.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/indicator.dart';
import 'package:flutter/material.dart';

class OnboardingFooter extends StatefulWidget {
  const OnboardingFooter({
    super.key,
    required this.currentIndex,
    required this.onSkip,
    required this.onNext,
    required this.pageController,
  });
  final int currentIndex;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final PageController pageController;

  @override
  State<OnboardingFooter> createState() => _OnboardingFooterState();
}

class _OnboardingFooterState extends State<OnboardingFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // ليه محطتش ال Top ?
        // عشان انا حاطط من ال bottom من ال container الي فوقها !!
        // معنى كدة مش لازم احطها من الاخر!
        // Abdallah!
        left: MediaQuery.sizeOf(context).width * (40 / 375),
        right: MediaQuery.sizeOf(context).width * (40 / 375),
        bottom: MediaQuery.sizeOf(context).width * (37 / 375),
      ),
      child: Container(
        // this must be as this  MediaQuery.sizeOf(context).height * (34 / 812) but the font size not responsive!!
        // Abdallah!
        height: MediaQuery.sizeOf(context).height * (40 / 812),
        width: MediaQuery.sizeOf(context).height * (295 / 375),
        color: AppColor.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: widget.onSkip,
              child: Text(
                widget.currentIndex == onboardingList.length - 1 ? "" : 'Skip',
                style: Styels.textStyleMedium18.copyWith(
                  color: Colors.white.withAlpha(150),
                ),
              ),
            ),
            Indicator(
              currentIndex: widget.currentIndex,
              goToPage: (index) => animateToPage(index),
            ),
            TextButton(
              onPressed: widget.onNext,
              child: Text(
                widget.currentIndex == onboardingList.length - 1
                    ? "Start"
                    : 'Next',
                style: Styels.textStyleMedium18.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> animateToPage(int index) {
    return widget.pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
