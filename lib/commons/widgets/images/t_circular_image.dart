import 'package:flutter/material.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/helpers/helper_functions.dart';


class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          // If backgroundcolor is null then switch it to the light and dark mode color design,
          color: backgroundColor ?? (dark ? TColors.black : TColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image(
          image: isNetworkImage
              ? NetworkImage(image)
              : const AssetImage(
                  TImages.user,
                ) as ImageProvider,
          color: overlayColor,
          fit: fit,
        ),
      ),
    );
  }
}
