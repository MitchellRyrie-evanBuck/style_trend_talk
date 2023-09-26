import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/layout/drawer_widget.dart';
import 'package:style_trend_talk/layout/header_widget.dart';
import 'package:style_trend_talk/layout/navigationBar.dart';
import '../index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: HeaderWidget(),
          body: SafeArea(
            child: _buildView(),
          ),
          drawer: DrawerWidget(),
          bottomNavigationBar: NavigationBarWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButton: IconButton(
            icon: Icon(FontAwesomeIcons.userCircle),
            onPressed: () {
              // 点击菜单按钮的回调函数
            },
          ),
        );
      },
    );
  }
}
