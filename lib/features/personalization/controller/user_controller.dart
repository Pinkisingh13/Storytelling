import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:storytelling/data/repositories/user/user_repository.dart';
import 'package:storytelling/features/personalization/model/user_model.dart';
import 'package:storytelling/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //  Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to first and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');

        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredentials.user!.email ?? '',
          password: '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Saving user data to the  firestore
        userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackbar(
          title: 'Data not saved!',
          message:
              'Something went wrong while saving your information. you can re-save your data in your profile.');
    }
  }
}
