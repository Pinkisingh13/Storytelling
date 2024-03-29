import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/bottom_navigation.dart';
import 'package:storytelling/data/repositories/authentication/authentication.dart';
import 'package:storytelling/features/personalization/controller/user_controller.dart';
import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/helpers/network_manager.dart';
import 'package:storytelling/utils/popups/full_screen_loader.dart';
import 'package:storytelling/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final RxBool togglePassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialogue(
          'We are Processing your Request...', TImages.docerAnimation);

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Log in user using email and password Authentication
      await AuthenticationRepo.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect to screen
      await AuthenticationRepo.instance.screenRedirect();

      // Show Success Snackbar
      TLoaders.successSnackbar(title: 'Successfully Logged in');

      // Redirect to other Screen
      Get.offAll(() => const BottomNavigationBarClass());
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh Snap!');
      TFullScreenLoader.stopLoading();
    }
  }

  /// -- Google Signin Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialogue(
          'Logging you in..', TImages.docerAnimation);

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepo.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove the Loader
      TFullScreenLoader.stopLoading();

      // Success snackbar
      TLoaders.successSnackbar(title: 'Successfully logged in');

      // Redirect
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(
        title: 'Oh Snap!',
      );
    }
  }
}
