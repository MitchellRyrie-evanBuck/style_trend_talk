import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/layout/drawer_widget.dart';
import 'package:style_trend_talk/layout/header_widget.dart';

import '../index.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MainPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: HeaderWidget(),
          drawer: DrawerWidget(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
