import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:style_trend_talk/layout/drawer_widget.dart';
// import 'package:style_trend_talk/layout/header_widget.dart';
import 'package:style_trend_talk/pages/main/widgets/app_header.dart';
import 'package:style_trend_talk/pages/main/widgets/drawer/mainDrawer.dart';
import 'package:style_trend_talk/pages/main/widgets/follow/index.dart';
import 'package:style_trend_talk/pages/main/widgets/recommendation.dart';

import '../index.dart';

final List<Widget> listRouterWidget = [
  const RecommendationPageMiddle(),
  const FollowPage(),
  const Center(child: Text('Tab 3')),
  const Center(child: Text('Tab 4')),
  const Center(child: Text('Tab 5')),
];

class MainPageMiddle extends StatefulWidget {
  const MainPageMiddle({super.key});

  @override
  State<MainPageMiddle> createState() => _MainPageMiddleState();
}

class _MainPageMiddleState extends State<MainPageMiddle>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 启用状态保持

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build

    return const MainPage();
  }
}

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HomeMiddleWareWidge();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return
            // DefaultTabController(
            //     length: listRouterWidget.length,
            //     child:
            Scaffold(
          // appBar: HeaderWidget(),
          // drawer: DrawerWidget(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
        // );
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
  }

  @override
  void dispose() {
    _tabController.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          // 在这里处理滚动通知
          if (scrollNotification is ScrollEndNotification) {
            // 滚动结束时的处理逻辑
            print('scrollNotification-----${scrollNotification.metrics}');
            print(
                'scrollNotification--toString---${scrollNotification.toString()}');
            print(
                'scrollNotification--noSuchMethod---${scrollNotification.noSuchMethod}');
            print(
                'scrollNotification--dispatch---${scrollNotification.dispatch}');

            // 可以检测列表中的视频是否在视窗内，然后触发自动播放
          }
          return false;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            HomeAppHeader(tabController: _tabController),
            SliverFillRemaining(
              child: _pageViews(),
            ),
          ],
        ));
  }

  PageView _pageViews() {
    return PageView.builder(
      itemCount: listRouterWidget.length,
      controller: getMainController.pageController,
      onPageChanged: (index) {
        // getMainController.setIndex(index);

        _tabController.animateTo(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      itemBuilder: (context, index) {
        return PageStorage(
          bucket: PageStorageBucket(), // 创建一个新的存储桶
          child: listRouterWidget[index],
        );
      },
    );
  }
}
