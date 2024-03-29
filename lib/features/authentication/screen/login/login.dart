import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/styles/spacing_style.dart';
import 'package:storytelling/commons/widgets/login_signup/form_divider.dart';
import 'package:storytelling/commons/widgets/login_signup/login_singup_header.dart';
import 'package:storytelling/commons/widgets/login_signup/social_buttons.dart';
import 'package:storytelling/features/authentication/screen/login/widgets/login_form.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: TSpacingStyles.paddingWithAppBarHeight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    /// Logo, Title And SubTitle
                    const PLoginSignupHeader(
                      title: TTexts.loginTitle,
                      subTitle: TTexts.loginSubTitle,
                    ),

                    // Form
                    const PLoginForm(),

                    /// Divider
                    PFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
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
