import 'package:get/get.dart';

class TabIndexController extends GetxController {
  TabIndexController();
  final RxInt index = 0.obs;

  _initData() {
    update(["tabIndex"]);
  }

  void onTap() {}

  Future<void> setIndex(int value) async {
    print('setIndex: $value');
    index.value = value;
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
