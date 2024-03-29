import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storytelling/features/shop/model/data.dart';
import 'package:storytelling/features/shop/model/storymodel.dart';
import 'package:storytelling/features/shop/screen/homescreen/widgets/storybody_design.dart';
import 'package:storytelling/utils/constants/sizes.dart';

class StoryBodyGridview extends StatelessWidget {
  const StoryBodyGridview({super.key, required this.years});
  final YearsModel years;
  @override
  Widget build(BuildContext context) {
    final yearCategory =
        storyBodyData.where((story) => story.id.contains(years.id)).toList();
    return GridView.builder(
      itemBuilder: (context, index) {
        return StoryBodyDesign(
          story: yearCategory[index],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: TSizes.crossAxisCount,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisSpacing: TSizes.gridViewSpacing,
      ),
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        top: TSizes.defaultSpace,
      ),
      itemCount: yearCategory.length,
    );
  }
}
