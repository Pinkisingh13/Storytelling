import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storytelling/features/authentication/screen/password_config/reset_password.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/constants/text_strings.dart';
import 'package:storytelling/utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: THelperFunctions.isDarkMode(context)
                ? TColors.white
                : TColors.black,
          ),
        ),
        toolbarHeight: 30,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                  image: const AssetImage(
                    TImages.forgetPasswordIllustration,
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
          
                /// Headings
                Text(
                  TTexts.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Text(TTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2,
                ),
          
                /// TextField
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: TTexts.email,
                    prefixIcon: Icon(
                      Iconsax.direct_right,
                      color: TColors.accent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
          
                /// Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const ResetPasswordScreen());
                    },
                    child: const Text(TTexts.submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
