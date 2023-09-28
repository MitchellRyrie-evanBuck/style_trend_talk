import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  LoginController();
  final RxBool isAgreed = false.obs;
  final RxBool isLoginMobile = false.obs;
  final TextEditingController textController = TextEditingController();
  final RxBool isValidateMobile = false.obs;

  _initData() {
    update(["login"]);
  }

  void onTap() {}

  void onCheckboxChanged(bool value) {
    isAgreed.value = value;
  }

  // 创建异步方法

  Future<void> onLoginMobileChanged(bool value) async {
    isLoginMobile.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    textController.addListener(_handlePhoneNumberChanged);
  }

  void _handlePhoneNumberChanged() {
    final phoneNumber = textController.text;
    // 使用正则表达式验证手机号格式
    final RegExp regex = RegExp(r'^\d{11}$'); // 10位数字作为示例
    final isValid = regex.hasMatch(phoneNumber);
    if (isValid) {
      isValidateMobile.value = true;
    } else {
      isValidateMobile.value = false;
    }
  }

  void getOnHomePage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', true);
    Get.toNamed("/home");
  }

  // 清楚输入框内容
  void clearText() {
    textController.clear();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    // 在控制器关闭时释放资源
    textController.dispose();
    super.onClose();
  }
}
