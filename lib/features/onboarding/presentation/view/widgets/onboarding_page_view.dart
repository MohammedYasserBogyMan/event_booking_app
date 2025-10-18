import 'package:event_booking_app/core/utils/onboarding_list.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/custom_onboarding_page.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder:
          (context, index) =>
              CustomOnboardingPage(onboardingModel: onboardingList[index]),
    );
  }
}
