import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/widgets/loaders/animation_loader.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  /// Open a full-Screen loading dialog with a given Text and animation.
  /// This method does not return anything.
  /// Parameters:
  //  - text : The text to be displayed in the dialog.
  //  - animation : the Lottie animation to be shown.
  static void openLoadingDialogue(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, //Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, //The dialog can't be dismissed by tapping outside
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child:  Column(
            children: [
               const SizedBox(
                height: 250,
              ),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }


/// Stop the currently open loading dialog.
/// This method does not return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
