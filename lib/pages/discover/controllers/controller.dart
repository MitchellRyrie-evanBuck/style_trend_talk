import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  DiscoverController();
  PageController tabPageController = PageController();
  PageController videoPageController = PageController();

  final RxInt currentIndex = RxInt(0);

  _initData() {
    update(["discover"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void setIndex(index) {
    currentIndex.value = index;
    tabPageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    update(["discover"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    tabPageController.dispose();
    videoPageController.dispose();
    super.onClose();
  }
}
