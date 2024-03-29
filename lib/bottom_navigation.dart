import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storytelling/features/personalization/screen/profile/profile.dart';
import 'package:storytelling/features/shop/screen/homescreen/home.dart';
import 'package:storytelling/features/shop/screen/wishlist/wishlist.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/helpers/helper_functions.dart';

class BottomNavigationBarClass extends StatelessWidget {
  const BottomNavigationBarClass({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottonNavigationBarController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class BottonNavigationBarController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Wishlist(),
    const ProfileScreen(),
  ];
}
