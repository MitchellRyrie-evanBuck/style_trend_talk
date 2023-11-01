import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../index.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final bool loginflag = false;
  final LoginController loginController = Get.put(LoginController());
  final FocusNode _focusNode = FocusNode();

  // 主视图
  Widget _buildView(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Image(
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        _loginForm(context)
      ],
    );
  }

  Positioned _loginForm(BuildContext context) {
    const double contextHeight = 300;
    final double loginBtnWidth = MediaQuery.of(context).size.width - 80;
    final double loginBgWidth = MediaQuery.of(context).size.width - 60;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Opacity(
        opacity: 0.95,
        child: Container(
          height: contextHeight,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 249, 249, 249),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(children: [
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome to Blur!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('即刻开始创作',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              width: loginBgWidth,
              child: _loginController(context, loginBtnWidth),
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                  width: 16,
                  child: Checkbox(
                      shape: CircleBorder(),
                      value: loginController.isAgreed.value,
                      onChanged: (value) {
                        loginController.onCheckboxChanged(value ?? false);
                      },
                      activeColor: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  '我已阅读并同意 用户协议 和 隐私政策',
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 171, 171, 171)),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Stack _loginController(BuildContext context, double loginBtnWidth) {
    final double loginBgLeft =
        (MediaQuery.of(context).size.width - 60) / 2 - 23;

    return Stack(
      children: [
        AnimatedPositioned(
          left: loginController.isLoginMobile.value ? -loginBtnWidth + -40 : 10,
          duration: const Duration(milliseconds: 300),
          child: _appleLogin(loginBtnWidth),
        ),
        AnimatedPositioned(
          left: loginController.isLoginMobile.value ? 10 : loginBtnWidth + 40,
          duration: const Duration(milliseconds: 300),
          child: _textField(loginBtnWidth),
        ),
        // _googleLogin(loginBtnWidth),
        const SizedBox(
          height: 30,
        ),
        AnimatedPositioned(
            top: 70,
            left: loginBgLeft,
            duration: const Duration(milliseconds: 300),
            child: GestureDetector(
              onTap: () async {
                await loginController
                    .onLoginMobileChanged(!loginController.isLoginMobile.value);
                if (loginController.isValidateMobile.value) {
                  loginController.getOnHomePage();
                  return;
                }
                if (!loginController.isLoginMobile.value) {
                  _focusNode.unfocus();
                }
                if (!loginController.isLoginMobile.value) {
                  loginController.clearText();
                }
              },
              child: Container(
                width: 46,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 236, 236),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  !loginController.isLoginMobile.value
                      ? FontAwesomeIcons.mobile
                      : loginController.isValidateMobile.value
                          ? FontAwesomeIcons.arrowRight
                          : FontAwesomeIcons.arrowLeft,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            )),
      ],
    );
  }

  Widget _textField(double loginBtnWidth) {
    return ClipRRect(
        // 裁剪一个borderRadius为25的矩形
        borderRadius: BorderRadius.circular(25),
        child: Container(
            height: 50,
            width: loginBtnWidth,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: TextField(
              controller: loginController.textController,
              focusNode: _focusNode,
              keyboardType: TextInputType.phone, // 设置输入类型为电话号码
              style: const TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  FontAwesomeIcons.mobile,
                  color: Color.fromARGB(255, 69, 69, 69),
                  size: 18,
                ),
                border: InputBorder.none,
              ),
            )));
  }

  Container _googleLogin(double loginBtnWidth) {
    return Container(
      height: 50,
      width: loginBtnWidth,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 5),
                blurRadius: 10)
          ]),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign in with Google',
              style: TextStyle(color: Colors.white),
            )
          ]),
    );
  }

  Container _appleLogin(double loginBtnWidth) {
    return Container(
      height: 50,
      width: loginBtnWidth,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 5),
                blurRadius: 10)
          ]),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.apple, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign in with Apple',
              style: TextStyle(color: Colors.white),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          body: Obx(() {
            return loginflag
                ? SafeArea(
                    child: _buildView(context),
                  )
                : _buildView(context);
          }),
        );
      },
    );
  }
}
