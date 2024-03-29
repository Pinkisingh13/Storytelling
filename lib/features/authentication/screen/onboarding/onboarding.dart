import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/features/authentication/controller/onboarding/onboarding.controller.dart';
import 'package:storytelling/features/authentication/screen/onboarding/widgets/onboarding_page.dart';
import 'package:storytelling/features/authentication/screen/onboarding/widgets/onboardingdotnavigation.dart';
import 'package:storytelling/features/authentication/screen/onboarding/widgets/onboardingnextbutton.dart';

import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      // backgroundColor: TColors.tertiary,
      body: Stack(
        children: [

          
          /// -- BackgroundImage --
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(TImages.onboardingBackgroundImage4),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// --- Horizontaol Scrollable Page ---
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage4,
                title: TTexts.onBoardingTitle4,
                subtitle: TTexts.onBoardingSubTitle4,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage5,
                title: TTexts.onBoardingTitle5,
                subtitle: TTexts.onBoardingSubTitle5,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage6,
                title: TTexts.onBoardingTitle6,
                subtitle: TTexts.onBoardingSubTitle6,
              ),
            ],
          ),

          /// --- Dot Navigation SmoothIndicator ---
          const OnBoardingDotNavigation(),

          /// --- Circular Button ---
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
