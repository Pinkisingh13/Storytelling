import 'package:flutter/material.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/helpers/helper_functions.dart';

class TTabs extends StatelessWidget {
  const TTabs({
    super.key,
    required this.height,
    required this.width,
    this.fontSize = 10,
    required this.title,
  });
  final double height, width;
  final double? fontSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: TColors.darkerGrey),
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 13, color: dark ? TColors.grey : TColors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
