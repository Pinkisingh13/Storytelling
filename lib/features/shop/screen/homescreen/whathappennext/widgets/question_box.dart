import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: dark ? TColors.light : TColors.dark,
        minimumSize: const Size(310, 68),
      ),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: dark ? TColors.dark : TColors.light),
      ),
    );
  }
}
