import 'package:event_booking_app/core/utils/onboarding_list.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/custom_painted_background.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/onboarding_footer.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/onboarding_pages.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _onNext() {
    if (_currentPage < onboardingList.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _onSkip() {
    _controller.jumpToPage(onboardingList.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaintedBackground(),
        ),
        Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingList.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  final item = onboardingList[index];
                  return OnboardingPage(
                    imagePath: item.imagePath,
                    title: item.title,
                    description: item.description,
                  );
                },
              ),
            ),
            OnboardingFooter(
              currentPage: _currentPage,
              pageCount: onboardingList.length,
              onNext: _onNext,
              onSkip: _onSkip,
            ),
          ],
        ),
      ],
    );
  }
}
