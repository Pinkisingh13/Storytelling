import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storytelling/commons/widgets/appbar/appbar.dart';
import 'package:storytelling/commons/widgets/images/t_circular_image.dart';
import 'package:storytelling/commons/widgets/text/section_heading.dart';
import 'package:storytelling/features/personalization/controller/user_controller.dart';
import 'package:storytelling/features/personalization/screen/profile/change_name.dart';
import 'package:storytelling/features/personalization/screen/profile/widgets/profile_menu.dart';

import 'package:storytelling/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: TAppBar(
        isCenterTitle: true,
        showBackArrow: false,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Picture --
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                     TCircularImage(
                      isNetworkImage: true,
                      // fit: BoxFit.contain,
                      // image: TImages.user,
                      image: controller.user.value.profilePicture,
                      width: 90,
                      height: 90,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              /// Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Obx(
                () => TProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () {
                    Get.to(() => const ChangeName());
                  },
                ),
              ),

              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Heading Personal Info
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone no: ',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Female',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: '13 Dec, 2001',
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
