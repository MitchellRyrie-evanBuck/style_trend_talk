import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();
  final RxBool isAgreed = false.obs;
  //

  _initData() {
    update(["login"]);
  }

  void onTap() {}

  void onCheckboxChanged(bool value) {
    isAgreed.value = value;
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
