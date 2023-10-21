// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:style_trend_talk/data/index.dart';
// import 'package:style_trend_talk/pages/main/views/view.dart';

class MainController extends GetxController {
  MainController();
// late TabController tabController;
  final RxDouble indicatorPadding = RxDouble(15);
  final RxList<RecommendationModel> dataList = RxList<RecommendationModel>([]);
  final PagingController<int, RecommendationModel> pagingController =
      PagingController(firstPageKey: 1);
  static const pageSize = 10;

  _initData() {
    pagingController.addPageRequestListener((pageKey) {
      print('触底: $pageKey');
      // Simulate loading data from an API
      // fetchData(pageKey);
    });

    updatePageList(recommendationListSource);
    update(["main"]);
    update(["recommendation"]);
  }

  void updateIndicatorPadding(double value) {
    indicatorPadding.value = value;
    update();
  }

  Future updatePageList(List<RecommendationModel> list) async {
    dataList.addAll(list);
    pagingController.appendLastPage(list);
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
