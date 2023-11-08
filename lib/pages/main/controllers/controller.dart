import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:style_trend_talk/data/index.dart';
// import 'package:style_trend_talk/pages/main/views/view.dart';

class MainController extends GetxController {
  MainController();

  // final TabController tabController;
  final RxDouble indicatorPadding = RxDouble(15);
  PageController pageController = PageController();
  final RxInt currentIndex = RxInt(0);

  final RxList<RecommendationModel> dataList = RxList<RecommendationModel>([]);
  final PagingController<int, RecommendationModel> pagingController =
      PagingController(firstPageKey: 0);
  static const _pageSize = 10;

  _initData() {
    pagingController.addPageRequestListener((pageKey) {
      print('pageKey---->${pageKey}');
      fetchData(pageKey);
    });
    pagingController.addStatusListener((pageState) {
      print('pageState---->${pageState}');
    });

    pageController.addListener(() {
      print('pageController---->${pageController.page}');
    });

    update(["main"]);
    update(["recommendation"]);
  }

  void updateIndicatorPadding(double value) {
    indicatorPadding.value = value;
    update();
  }

  void setIndex(index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    update(["main"]);
    update(["recommendation"]);
  }

  Future<void> fetchRefresh() async {
    pagingController.refresh();
    // pagingController.itemListController.clear();
    //  pagingController.reset();
  }

  Future<void> fetchData(int pageKey) async {
    // ignore: avoid_print
    print('触底: $pageKey');
    await Future.delayed(const Duration(seconds: 1));

    try {
      final newItems = await getBeerList(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey as int?);
      }
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
    pagingController.dispose();
    super.onClose();
  }
}
