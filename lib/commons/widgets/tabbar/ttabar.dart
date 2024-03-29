import 'package:flutter/material.dart';
import 'package:storytelling/commons/widgets/tabbar/tab_container.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/constants/text_strings.dart';
import 'package:storytelling/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget {
  const TTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 3,
      indicatorColor: dark ? TColors.white : TColors.black,
      tabs: const [
        TTabs(
          height: 30,
          width: 85,
          title: TTexts.firstYear,
        ),
        TTabs(
          height: 30,
          width: 85,
          title: TTexts.secondYear,
        ),
        TTabs(
          height: 30,
          width: 85,
          title: TTexts.thirdYear,
        ),
        TTabs(
          height: 30,
          width: 130,
          title: TTexts.forthYear,
        ),
      ],
    );
  }
}

