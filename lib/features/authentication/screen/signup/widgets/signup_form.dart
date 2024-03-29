import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storytelling/commons/widgets/animatedbutton/animated_container_button.dart';
import 'package:storytelling/features/authentication/controller/signup/signup_controller.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/constants/text_strings.dart';
import 'package:storytelling/utils/validators/validation.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First Name
          TextFormField(
            validator: (value) =>
                TValidator.validateEmptyText('firstname', value),
            controller: controller.firstName,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Iconsax.user,
              ),
              labelText: TTexts.firstName,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Last Name
          TextFormField(
            validator: (value) =>
                TValidator.validateEmptyText('lastname', value),
            controller: controller.lastName,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Iconsax.user,
              ),
              labelText: TTexts.lastName,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Phone no
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Iconsax.call,
              ),
              labelText: TTexts.phoneNo,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Iconsax.direct,
              ),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Password
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.tooglePassword.value,
              decoration:  InputDecoration(
                prefixIcon: const Icon(
                  Iconsax.password_check,
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.tooglePassword.value =
                      !controller.tooglePassword.value,
                  icon: Icon(
                    controller.tooglePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
                labelText: TTexts.password,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // Signup Button
          SigninButton(
            child: ElevatedButton(
              onPressed: () {
                controller.signup();
              },
              child: Text(
                TTexts.createAccount,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
