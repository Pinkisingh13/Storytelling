import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:storytelling/data/repositories/authentication/authentication.dart';
import 'package:storytelling/utils/constants/image_strings.dart';
import 'package:storytelling/utils/constants/sizes.dart';
import 'package:storytelling/utils/constants/text_strings.dart';

class THomeHeader extends StatelessWidget {
  const THomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            IconButton(
              onPressed: () {
                AuthenticationRepo.instance.logout();
              },
              icon: const Icon(Iconsax.logout),
            )
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          TTexts.homeAppbarSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        const Image(
          image: AssetImage(TImages.mainImage),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Text(
          "Dive into our library",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
