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
      PagingController(firstPageKey: 0);
  static const _pageSize = 10;

  _initData() {
    pagingController.addPageRequestListener((pageKey) {
      // Simulate loading data from an API
      fetchData(pageKey);
    });

    // updatePageList(recommendationListSource);
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

  Future<void> fetchData(int pageKey) async {
    print('触底: $pageKey');

    try {
      // final newItems = await RemoteApi.getBeerList(pageKey, _pageSize);
      // final isLastPage = newItems.length < _pageSize;
      // if (isLastPage) {
      //   pagingController.appendLastPage(newItems);
      // } else {
      //   final nextPageKey = pageKey + newItems.length;
      //   pagingController.appendPage(newItems, nextPageKey as int?);
      // }
    } catch (error) {
      pagingController.error = error;
    }
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
