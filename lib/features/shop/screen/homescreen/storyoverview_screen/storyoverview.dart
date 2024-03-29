import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/widgets/appbar/appbar.dart';
import 'package:storytelling/features/shop/controller/wishlist/wishlist_controller.dart';
import 'package:storytelling/features/shop/model/storymodel.dart';
import 'package:storytelling/features/shop/screen/homescreen/full_story_screen/fullstory.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/device/device_utility.dart';

class StoryOverView extends StatelessWidget {
  const StoryOverView({super.key, required this.story});
  final StoryBodyModel story;
  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(WishListController());
    return Scaffold(
      appBar: TAppBar(
        isCenterTitle: true,
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image:  AssetImage(story.imageurl,),
                height: TDeviceUtils.getScreenHeight() / 2.70,
                width: TDeviceUtils.getScreenWidth(context) / 1.20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    story.title,
                  ),
                  IconButton(
                    onPressed: () {
                      controller.adddAndRemoveFromWishlist(story);
                    },
                    icon: const Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                story.time,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                story.discription,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => FullStory(story: story));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320, 48),
                ),
                child: const Text(
                  "Start Reading",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
