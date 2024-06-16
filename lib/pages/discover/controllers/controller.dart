import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/models/mock/discover.dart';

class DiscoverController extends GetxController {
  DiscoverController();
  PageController tabPageController = PageController();
  PageController videoPageController = PageController();

  final RxInt currentIndex = RxInt(0);

  late RxList<DiscoverModel> discoverList = RxList<DiscoverModel>([]);

  _initData() {
    // 先去获取十条视频
    getDiscoverInfoList();
    update(["discover"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> getDiscoverInfoList() async {
    try {
      // 调用你的API获取数据，这里使用假数据 discoverItems 代替
      List<DiscoverModel> newList = await getDiscoverList(1, 10);

      // 将新的数据添加到之前的数组中
      discoverList.addAll(newList);

      update(["discover"]);
    } catch (e) {}
  }

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
