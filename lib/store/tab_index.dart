import 'package:get/get.dart';

class TabIndexController extends GetxController {
  TabIndexController();
  final RxInt index = 0.obs;
  final RxBool publishFlag = false.obs;

  _initData() {
    update(["tabIndex"]);
  }

  void onTap() {}

  Future<void> setIndex(int value) async {
    index.value = value;
    update();
  }

  Future<void> setPublishFlag(bool value) async {
    publishFlag.value = value;
    update();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
