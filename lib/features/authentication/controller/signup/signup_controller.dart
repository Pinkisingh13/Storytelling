import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:storytelling/data/repositories/authentication/authentication.dart';
import 'package:storytelling/data/repositories/user/user_repository.dart';
import 'package:storytelling/features/authentication/screen/signup/verify_email.dart';
import 'package:storytelling/features/personalization/model/user_model.dart';
import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/helpers/network_manager.dart';
import 'package:storytelling/utils/popups/full_screen_loader.dart';
import 'package:storytelling/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instanc => Get.find();

  /// Variables
  final RxBool tooglePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// --- Signup ---
  Future<void> signup() async {
    try {
      //  Start Loading
      TFullScreenLoader.openLoadingDialogue(
          'We are Processing your Request...', TImages.docerAnimation);

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Register user in the Firebase Authentiction & save user data in the firestore
      final userCredential = await AuthenticationRepo.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// save Authentication User Data in the Firebase Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(
        UserModel(
            id: userCredential.user!.uid,
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            email: email.text.trim(),
            password: password.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: ''),
      );
      /// Move to Verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text,));
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh Snap!!', message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}
