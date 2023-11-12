import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/pages/notification/widgets/group/index.dart';
import 'package:style_trend_talk/pages/notification/widgets/index.dart';
import 'package:style_trend_talk/pages/notification/widgets/notification_header.dart';

import '../index.dart';

List<Widget> listNotificationRouterWidget = [
  const NotifierMainViewWidget(),
  const GroupPages()
];

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const NotificationMiddleWareWidge();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      id: "notification",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

class NotificationMiddleWareWidge extends StatefulWidget {
  const NotificationMiddleWareWidge({super.key});

  @override
  State<NotificationMiddleWareWidge> createState() =>
      _NotificationMiddleWareWidgeState();
}

class _NotificationMiddleWareWidgeState
    extends State<NotificationMiddleWareWidge> {
  @override
  Widget build(BuildContext context) {
    return const NotifierController();
  }
}

class NotifierController extends StatefulWidget {
  const NotifierController({super.key});

  @override
  State<NotifierController> createState() => _NotifierControllerState();
}

class _NotifierControllerState extends State<NotifierController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late double indicatorPadding = 15;
  final NotificationController getNotificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: listNotificationRouterWidget.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const NotificationAppHeader(),
        SliverFillRemaining(
          child: PageView.builder(
            itemCount: listNotificationRouterWidget.length,
            // controller: getNotificationController.pageController,
            onPageChanged: (index) {
              // getMainController.setIndex(index);

              // _tabController.animateTo(
              //   index,
              //   duration: const Duration(milliseconds: 300),
              //   curve: Curves.ease,
              // );
            },
            itemBuilder: (context, index) {
              return PageStorage(
                bucket: PageStorageBucket(), // 创建一个新的存储桶
                child: listNotificationRouterWidget[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
