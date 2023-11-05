import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:style_trend_talk/layout/drawer_widget.dart';
// import 'package:style_trend_talk/layout/header_widget.dart';
import 'package:style_trend_talk/pages/main/widgets/app_header.dart';
import 'package:style_trend_talk/pages/main/widgets/follow/index.dart';
import 'package:style_trend_talk/pages/main/widgets/recommendation.dart';

import '../index.dart';

final List<Widget> listRouterWidget = [
  RecommendationPage(),
  const FollowPage(),
  const Center(child: Text('Tab 3')),
  const Center(child: Text('Tab 4')),
  const Center(child: Text('Tab 5')),
];

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return HomeMiddleWareWidge();
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

class HomeMiddleWareWidge extends StatefulWidget {
  const HomeMiddleWareWidge({super.key});

  @override
  State<HomeMiddleWareWidge> createState() => _HomeMiddleWareWidgeState();
}

class _HomeMiddleWareWidgeState extends State<HomeMiddleWareWidge>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late double indicatorPadding = 15;
  final MainController getMainController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: listRouterWidget.length, vsync: this);
    _tabController.animation?.addListener(_onTabBarScroll);
  }

  @override
  void dispose() {
    _tabController.dispose(); // 释放资源
    super.dispose();
  }

  void _onTabBarScroll() {
    double? number = _tabController.animation?.value;
    String numberString = number.toString();
    String decimalPart = '0.0';
    if (numberString.split('.').length > 1) {
      decimalPart = '0.${numberString.split('.')[1]}';
    }
    if (decimalPart == '0.0') {
      decimalPart = '1';
    }
    double paddindResult = double.parse(decimalPart);
    getMainController.updateIndicatorPadding(paddindResult * 15);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        HomeAppHeader(tabController: _tabController),
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: listRouterWidget,
          ),
        ),
      ],
    );
  }
}
