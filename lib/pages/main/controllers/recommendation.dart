// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:style_trend_talk/pages/main/views/view.dart';

class RecommendationController extends GetxController {
  RecommendationController();

  _initData() {
    update(["recommendation"]);
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
