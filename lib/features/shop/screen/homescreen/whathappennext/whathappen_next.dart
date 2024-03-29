import 'package:flutter/material.dart';
import 'package:storytelling/commons/styles/spacing_style.dart';
import 'package:storytelling/commons/widgets/appbar/appbar.dart';
import 'package:storytelling/features/shop/screen/homescreen/whathappennext/widgets/question_box.dart';
import 'package:storytelling/utils/constants/sizes.dart';


class WhatHappen extends StatelessWidget {
  const WhatHappen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text(
          "What happens next?",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              QuestionBox(title: "The crow saw a pot in a garden"),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              QuestionBox(
                title:
                    "The poor crow was so sad and didn${"'"}t know what to do.",
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              QuestionBox(
                title: "The crow kept working hard",
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              QuestionBox(
                title: "The crow couldn't find any water",
              )
            ],
          ),
        ),
      ),
    );
  }
}

