import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/layout/drawer_widget.dart';
import 'package:style_trend_talk/layout/header_widget.dart';
import 'package:style_trend_talk/pages/main/widgets/app_header.dart';

import '../index.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);
  final List<Widget> listRouterWidget = [
    Center(child: Text('Tab 1')),
    Center(child: Text('Tab 2')),
    Center(child: Text('Tab 3')),
    Center(child: Text('Tab 4')),
    Center(child: Text('Tab 5')),
  ];

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: <Widget>[
        HomeAppHeader(),
        SliverFillRemaining(
          child: TabBarView(
            children: listRouterWidget,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return DefaultTabController(
            length: listRouterWidget.length,
            child: Scaffold(
              // appBar: HeaderWidget(),
              // drawer: DrawerWidget(),
              body: SafeArea(
                child: _buildView(),
              ),
            ));
      },
    );
  }
}
