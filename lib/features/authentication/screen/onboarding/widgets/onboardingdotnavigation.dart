import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:storytelling/features/authentication/controller/onboarding/onboarding.controller.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/device/device_utility.dart';


class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight()*1.5,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(

          effect: const JumpingDotEffect(
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: TColors.secondary, 
          ), 
          controller: controller.pageController ,
          onDotClicked: controller.dotNavigationClick,
          count: 6,    
        ));
  }
}
