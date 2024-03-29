import 'package:flutter/material.dart';

import 'package:storytelling/commons/widgets/tabbar/ttabar.dart';
import 'package:storytelling/features/shop/model/data.dart';
import 'package:storytelling/features/shop/screen/homescreen/widgets/storybodywidget.dart';

class TDefaultTabTabController extends StatelessWidget {
  const TDefaultTabTabController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: TTabBar(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(
              clipBehavior: Clip.hardEdge,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (final years in yearsData) StoryBodyGridview(years: years),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

