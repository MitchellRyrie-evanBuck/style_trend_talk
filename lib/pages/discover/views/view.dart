import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/pages/discover/views/discoverFllow/discoverFllow.dart';
import 'package:style_trend_talk/pages/discover/views/discoverMain/discoverMain.dart';

import '../index.dart';
import 'header/discoverHeader.dart';

List<String> discoverListTabName = ["推荐", "关注"];
List<Widget> discoverRouterList = [
  const DiscoverMainTabPage(),
  const DiscoverFllowTabPage()
];

class DiscoverPage extends GetView<DiscoverController> {
  DiscoverPage({Key? key}) : super(key: key);

  final discoverController = Get.put(DiscoverController());

  // 主视图
  Widget _buildView() {
    return Container(
      decoration: const BoxDecoration(color: FitnessAppTheme.black),
      child: Stack(children: [
        // 视频控制器(占满整个底部)
        Positioned.fill(
          child: PageView.builder(
            controller: discoverController.tabPageController,
            scrollDirection: Axis.horizontal,
            itemCount: discoverListTabName.length, // 页面数量，假设有10个视频
            itemBuilder: (context, index) {
              return discoverRouterList[index];
            },
          ),
        ),
        // 表头
        const Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: Center(
              child: DiscoverPageMiddleWareController(),
            ))
        // 用户(文案)
        // 详情(文案)
        // 操作
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      init: DiscoverController(),
      id: "discover",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }
}

class DiscoverPageMiddleWareController extends StatefulWidget {
  const DiscoverPageMiddleWareController({super.key});

  @override
  State<DiscoverPageMiddleWareController> createState() =>
      _DiscoverPageMiddleWareControllerState();
}

class _DiscoverPageMiddleWareControllerState
    extends State<DiscoverPageMiddleWareController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: discoverListTabName.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDiscoverTabBarWidget(
      tabController: _tabController,
      discoverListTabName: discoverListTabName,
    );
  }
}
