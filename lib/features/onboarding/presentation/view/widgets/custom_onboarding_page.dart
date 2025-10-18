import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:event_booking_app/features/onboarding/presentation/view/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomOnboardingPage extends StatelessWidget {
  const CustomOnboardingPage({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    // log(MediaQuery.sizeOf(context).width.toString());
    // log(MediaQuery.sizeOf(context).height.toString());

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image(
            width: MediaQuery.sizeOf(context).width * (270 / 375),
            height: MediaQuery.sizeOf(context).height * (538 / 812),
            image: AssetImage(onboardingModel.imagePath),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: CustomContainer(
            child: Padding(
              padding: EdgeInsets.only(
                // bottom must be a 114 from buttom, this is a rule on a design 812*375
                // i apply it after make  a font Size responsive to all our application
                // Abdalalh !

                //////////
                ///
                // bottom: MediaQuery.sizeOf(context).height * (114 / 812),
                top: MediaQuery.sizeOf(context).height * (40 / 812),
                // right: MediaQuery.sizeOf(context).height * (40 / 812),
                // left: MediaQuery.sizeOf(context).height * (40 / 812),
              ),
              child: Column(
                children: [
                  Text(
                    onboardingModel.title,
                    style: Styels.textStyleMedium22,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    onboardingModel.description,
                    style: Styels.textStyleRegular15.copyWith(
                      color: Color(0xffFFFFFF).withAlpha(150),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
