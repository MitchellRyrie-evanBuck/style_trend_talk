import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../index.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final bool loginflag = false;
  final LoginController loginController = Get.put(LoginController());
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
    final double loginBtnWidth = MediaQuery.of(context).size.width - 80;
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Opacity(
        opacity: 0.95,
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 249, 249, 249),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                child: Stack(
              children: [
                Column(
                  children: [
                    Container(
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
                    ),

                    // Container(
                    //   height: 50,
                    //   width: loginBtnWidth,
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromARGB(255, 0, 0, 0),
                    //       borderRadius: BorderRadius.circular(20),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.black.withOpacity(0.1),
                    //             offset: const Offset(0, 5),
                    //             blurRadius: 10)
                    //       ]),
                    //   child: const Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Icon(FontAwesomeIcons.google, color: Colors.white),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           'Sign in with Google',
                    //           style: TextStyle(color: Colors.white),
                    //         )
                    //       ]),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 48,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 236, 236),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.mobileRetro,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                )
              ],
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
                SizedBox(
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
