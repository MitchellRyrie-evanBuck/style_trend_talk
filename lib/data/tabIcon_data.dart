import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabData {
  TabData(
      {this.imagePath = const Icon(FontAwesomeIcons.house),
      this.index = 0,
      this.selectedImagePath = const Icon(FontAwesomeIcons.house),
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
      imagePath: const Icon(
        FontAwesomeIcons.house,
      ),
      selectedImagePath: const Icon(
        FontAwesomeIcons.house,
      ),
      index: 0,
      isSelected: true,
      animationController: null,
      label: "首页",
    ),
    TabData(
      imagePath: const Icon(
        FontAwesomeIcons.magnifyingGlass,
      ),
      selectedImagePath: const Icon(
        FontAwesomeIcons.magnifyingGlass,
      ),
      index: 1,
      isSelected: false,
      animationController: null,
      label: "视频",
    ),
    TabData(
      imagePath: const Icon(
        FontAwesomeIcons.message,
      ),
      selectedImagePath: const Icon(
        FontAwesomeIcons.message,
      ),
      index: 2,
      isSelected: false,
      animationController: null,
      label: "消息",
    ),
    TabData(
      imagePath: const Icon(
        FontAwesomeIcons.productHunt,
      ),
      selectedImagePath: const Icon(
        FontAwesomeIcons.productHunt,
      ),
      index: 3,
      isSelected: false,
      animationController: null,
      label: "我",
    ),
  ];
}
