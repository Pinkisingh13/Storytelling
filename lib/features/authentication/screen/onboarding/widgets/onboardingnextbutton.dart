import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:storytelling/features/authentication/controller/onboarding/onboarding.controller.dart';
import 'package:storytelling/utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      left: TDeviceUtils.getScreenWidth(context)/2.30,
      top: TDeviceUtils.getScreenHeight()/1.50,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => controller.nextPage(),
        child: LottieBuilder.asset(
          animate: true,
          "assets/images/onboarding/play.json",
          // height: 230,
          // width: 230,
        ),
      ),
    );
  }
}
