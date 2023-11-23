import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:style_trend_talk/pages/notification/widgets/group/index.dart';
import 'package:style_trend_talk/pages/notification/widgets/message_search/search.dart';
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

  final EasyRefreshController _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );
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
    return EasyRefresh.builder(
        controller: _controller,
        onRefresh: () async {
          _controller.finishRefresh();
          _controller.resetFooter();
        },
        onLoad: () async {
          _controller.finishLoad(IndicatorResult.noMore);
        },
        childBuilder: (context, physics) {
          return NestedScrollView(
            floatHeaderSlivers: false,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                const NotificationAppHeader(),

                // SliverOverlapAbsorber(
                //     handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                //         context),
                //     sliver: const NotificationAppHeader()),
              ];
            },
            body: PageView.builder(
              itemCount: listNotificationRouterWidget.length,
              controller: getNotificationController.pageController,
              onPageChanged: (index) {},
              itemBuilder: (context, index) {
                return PageStorage(
                    bucket: PageStorageBucket(), // 创建一个新的存储桶
                    child: CustomScrollView(
                      slivers: <Widget>[
                        const SliverToBoxAdapter(
                          child: Column(
                            children: [
                              CustomSearch(),
                              // Add any other widgets you want to scroll with the list
                            ],
                          ),
                        ),
                        // TODO 取消左右滑动切换
                        listNotificationRouterWidget[index],
                        // SliverFillRemaining(
                        //   child: listNotificationRouterWidget[index],
                        // ),
                      ],
                    ));
              },
            ),
          );
        });
  }
}



     // CustomScrollView(
          //   slivers: <Widget>[
          //     const NotificationAppHeader(),
          //     const SliverToBoxAdapter(child: CustomSearch()),
          //     SliverFillRemaining(
          //       child: PageView.builder(
          //         itemCount: listNotificationRouterWidget.length,
          //         controller: getNotificationController.pageController,
          //         onPageChanged: (index) {},
          //         itemBuilder: (context, index) {
          //           return PageStorage(
          //             bucket: PageStorageBucket(), // 创建一个新的存储桶
          //             child: NestedScrollView(
          //                 headerSliverBuilder:
          //                     (BuildContext context, bool innerBoxIsScrolled) {
          //                   return <Widget>[];
          //                 },
          //                 body: listNotificationRouterWidget[index]),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // );