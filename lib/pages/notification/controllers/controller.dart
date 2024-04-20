import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:style_trend_talk/data/index.dart';

class NotificationController extends GetxController {
  NotificationController() {
    // 预加载
    _initData();
  }
  final PagingController<int, NotifierTionListModel> pagingController =
      PagingController(firstPageKey: 0);
  PageController pageController = PageController();

  static const _pageSize = 10;

  _initData() {
    pagingController.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
    update(["notification"]);
  }

  Future<void> fetchData(int pageKey) async {
    // ignore: avoid_print
    print('触底: $pageKey');
    await Future.delayed(const Duration(seconds: 1));

    try {
      final newItems = await getNotifiertionList(pageKey, _pageSize);
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

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    pagingController.dispose();
    pageController.dispose();

    super.onClose();
  }
}
