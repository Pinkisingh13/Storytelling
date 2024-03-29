import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/features/shop/model/storymodel.dart';
import 'package:storytelling/features/shop/screen/homescreen/storyoverview_screen/storyoverview.dart';
import 'package:storytelling/utils/constants/colors.dart';

class StoryBodyDesign extends StatelessWidget {
  const StoryBodyDesign({
    super.key,
    required this.story,
  });

  final StoryBodyModel story;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => StoryOverView(story: story));
      },
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image(
            image:   AssetImage(story.imageurl,),
            height: 140,
            width: 152,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 112,
            child: Container(
              width: 155,
              color: TColors.grey,
              child: Column(
                children: [
                  Text(
                    story.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 10, color: TColors.black),
                  ),
                  Text(
                    story.time,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 10, color: TColors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
