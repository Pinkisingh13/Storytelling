import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/commons/widgets/appbar/appbar.dart';
import 'package:storytelling/features/shop/controller/wishlist/wishlist_controller.dart';
import 'package:storytelling/features/shop/screen/homescreen/storyoverview_screen/storyoverview.dart';
import 'package:storytelling/utils/constants/sizes.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishListController());

    return Scaffold(
      appBar: TAppBar(
        isCenterTitle: true,
        showBackArrow: false,
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: PopScope(
        canPop: false,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            ()=> controller.wishList.isEmpty
                ? const Center(
                    child: Text('Wishlist is empty'),
                  )
                : ListView.separated(
                    itemCount: controller.wishList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final story = controller.wishList[index];
                      return InkWell(
                        onTap: () => Get.to(() => StoryOverView(story: story)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image(
                                  image: AssetImage(story.imageurl),
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      story.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(story.time),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
