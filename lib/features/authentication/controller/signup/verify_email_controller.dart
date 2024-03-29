import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/widgets/success_screen/success_screen.dart';
import 'package:storytelling/data/repositories/authentication/authentication.dart';
import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/constants/text_strings.dart';
import 'package:storytelling/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email Whenever Verify Screen appears & set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirection();
    super.onInit();
  }

  /// Send email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepo.instance.sendEmailVerification();
      TLoaders.successSnackbar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email');
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh Snap!!', message: e.toString());
    }
  }

  /// Timer to automatically redirect an email verification
  void setTimerForAutoRedirection() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: TImages.successfullyRegisterAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepo.instance.screenRedirect(),
            ));
      }
    });
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatusManually() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepo.instance.screenRedirect(),
          ));
    }
  }
}
