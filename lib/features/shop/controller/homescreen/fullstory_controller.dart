import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/styles/spacing_style.dart';
import 'package:storytelling/features/shop/model/data.dart';
import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/constants/text_strings.dart';

class FullStoryController extends GetxController {
  var currentPageIndex = 1.obs;
  final fullLength = fullStoryData.length;

  void changePage(BuildContext context) {
    if (currentPageIndex < fullLength - 1) {
      currentPageIndex++;
    } else {
      showModalBottomSheet(
        isDismissible: true,
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: TSpacingStyles.paddingWithAppBarHeight,
              child: Center(
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          TImages.appLogo2,
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                         Text(
                          TTexts.thankyou,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
              ),
            ),
             
          );
        },
      );
    }
  }
}

