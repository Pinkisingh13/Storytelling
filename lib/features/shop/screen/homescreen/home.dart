import 'package:flutter/material.dart';
import 'package:storytelling/features/shop/screen/homescreen/widgets/homescreen_header.dart';
import 'package:storytelling/features/shop/screen/homescreen/widgets/tdefault_tabcontroller.dart';
import 'package:storytelling/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & Subtitle
                THomeHeader(),
                SizedBox(
                  height: TSizes.spaceBtwSections * 1.60,
                ),

                // --- TabBar ---
               TDefaultTabTabController(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
