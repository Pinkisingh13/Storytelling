import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/helpers/helper_functions.dart';

class PSignupAppBar extends StatelessWidget {
  const PSignupAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Iconsax.arrow_circle_left,
          color: dark ? TColors.white  : TColors.dark,
        ),
      ),
    );
  }
}
