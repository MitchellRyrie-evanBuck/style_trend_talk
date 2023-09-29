import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabData {
  TabData(
      {this.imagePath = const Icon(FontAwesomeIcons.home),
      this.index = 0,
      this.selectedImagePath = const Icon(FontAwesomeIcons.home),
      this.isSelected = false,
      this.animationController,
      this.label = ''});

  Icon imagePath;
  Icon selectedImagePath;
  bool isSelected;
  int index;
  String label;

  AnimationController? animationController;

  static List<TabData> tabsList = <TabData>[
    TabData(
      imagePath: Icon(
        FontAwesomeIcons.home,
      ),
      selectedImagePath: Icon(
        FontAwesomeIcons.home,
      ),
      index: 0,
      isSelected: true,
      animationController: null,
      label: "首页",
    ),
    TabData(
      imagePath: Icon(
        FontAwesomeIcons.search,
      ),
      selectedImagePath: Icon(
        FontAwesomeIcons.search,
      ),
      index: 1,
      isSelected: false,
      animationController: null,
      label: "视频",
    ),
    TabData(
      imagePath: Icon(
        FontAwesomeIcons.message,
      ),
      selectedImagePath: Icon(
        FontAwesomeIcons.message,
      ),
      index: 2,
      isSelected: false,
      animationController: null,
      label: "消息",
    ),
    TabData(
      imagePath: Icon(
        FontAwesomeIcons.productHunt,
      ),
      selectedImagePath: Icon(
        FontAwesomeIcons.productHunt,
      ),
      index: 3,
      isSelected: false,
      animationController: null,
      label: "我",
    ),
  ];
}
