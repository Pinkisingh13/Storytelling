import 'package:flutter/material.dart';

class YearsModel {
  const YearsModel({
    required this.id,
    required this.text,
    this.backgroundColor = const Color.fromARGB(255, 52, 52, 52),
  });

  final String id;
  final String text;
  final Color backgroundColor;
}

class StoryBodyModel {
  StoryBodyModel({
    required this.id,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.discription,
  });
  final String id;
  final String imageurl;
  final String title;
  final String time;
  final String discription;
}

class FullStoryModel {
  FullStoryModel({
    required this.discription,
  });
  final String discription;
}

class StoryTheme {
  StoryTheme({
    required this.id,
    required this.storytitle,
    required this.image,
  });
  final String id;
  final String storytitle;
  final AssetImage image;
}
