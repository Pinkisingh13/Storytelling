import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:storytelling/utils/constants/image_strings.dart';

import '../../../../../utils/constants/sizes.dart';

class PLoginSignupHeader extends StatelessWidget {
  const PLoginSignupHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          /// Logo
          const Image(
              height: 150,
              image: AssetImage(TImages.appLogo2),
            ).animate().slideX(delay: const Duration(milliseconds: 200),curve: Curves.easeIn),
          const SizedBox(
            height: TSizes.sm,
          ),

          /// Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: TSizes.sm,
          ),

          /// SubTitle
          SizedBox(
            width: 250,
            height: 70,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
