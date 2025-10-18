import 'package:event_booking_app/core/services/shared_prefs_service.dart';
import 'package:event_booking_app/core/utils/onboarding_list.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/onboarding_footer.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    listenToPageChanges();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnBoardingPageView(pageController: pageController),
        Align(
          alignment: Alignment.bottomCenter,
          child: OnboardingFooter(
            currentIndex: currentPage,
            onSkip: skipOnBoardingPage,
            onNext:
                currentPage == onboardingList.length - 1
                    ? skipOnBoardingPage
                    : nextOnBoardingPage,
          ),
        ),
      ],
    );
  }

  void listenToPageChanges() {
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  void nextOnBoardingPage() {
    if (currentPage < onboardingList.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  Future<void> skipOnBoardingPage() async {
    await SharedPrefsService.I.handleOnboardingCompletion(context);
  }
}
