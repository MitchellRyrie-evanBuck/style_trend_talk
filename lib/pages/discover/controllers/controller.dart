import 'package:get/get.dart';

class DiscoverController extends GetxController {
  DiscoverController();

  _initData() {
    update(["discover"]);
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

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
