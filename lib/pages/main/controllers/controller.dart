// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:style_trend_talk/pages/main/views/view.dart';

class MainController extends GetxController {
  MainController();
// late TabController tabController;
  final RxDouble indicatorPadding = RxDouble(15);

  _initData() {
    update(["main"]);
  }

  void updateIndicatorPadding(double value) {
    indicatorPadding.value = value;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onInit() {
    // tabController = TabController(length: listRouterWidget.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // tabController.dispose();
    super.onClose();
  }
}
