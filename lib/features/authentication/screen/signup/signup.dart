import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/widgets/login_signup/form_divider.dart';
import 'package:storytelling/commons/widgets/login_signup/login_singup_header.dart';
import 'package:storytelling/commons/widgets/login_signup/social_buttons.dart';
import 'package:storytelling/features/authentication/screen/signup/widgets/signup_appbar.dart';
import 'package:storytelling/features/authentication/screen/signup/widgets/signup_form.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PSignupAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Image, Title & SubTitle
                const PLoginSignupHeader(
                  title: TTexts.signupTitle,
                  subTitle: TTexts.signupSubTitle,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                /// Form
                const PSignupForm(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Divider
                PFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Social Buttons
                const TSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
