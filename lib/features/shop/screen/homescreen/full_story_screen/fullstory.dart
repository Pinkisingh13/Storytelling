import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/widgets/appbar/appbar.dart';
import 'package:storytelling/features/shop/controller/homescreen/fullstory_controller.dart';
import 'package:storytelling/features/shop/model/data.dart';
import 'package:storytelling/features/shop/model/storymodel.dart';
import 'package:storytelling/features/shop/screen/homescreen/whathappennext/whathappen_next.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/constants/text_strings.dart';
import 'package:storytelling/utils/device/device_utility.dart';

class FullStory extends StatelessWidget {
  const FullStory({super.key, required this.story});
  final StoryBodyModel story;

  // @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FullStoryController());

    return Scaffold(
      appBar: TAppBar(
        title: Obx(
          () => Text(
            "page ${controller.currentPageIndex.value}  of ${controller.fullLength} ",
          ),
        ),
        showBackArrow: false,
        isCenterTitle: true,
        leadingIcon: Icons.arrow_back_ios_new_rounded,
        leadingOnPressed: () {
          if (controller.currentPageIndex.value > 1) {
            controller.currentPageIndex.value--;
          } else {
            Get.back();
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(story.imageurl,) ,
                fit: BoxFit.fill,
                height: TDeviceUtils.getScreenHeight() / 2.70,
                width: TDeviceUtils.getScreenWidth(context) / 1.20,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                story.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Obx(
                () => Text(
                  fullStoryData[controller.currentPageIndex.value].discription,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.changePage(context);
                  },
                  child: const Text(
                    TTexts.nextPage,
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const WhatHappen());
                  },
                  child: const Text(
                    TTexts.chooseWhatHappen,
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
