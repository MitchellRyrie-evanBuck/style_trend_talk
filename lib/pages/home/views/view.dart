import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
// import 'package:style_trend_talk/data/fitness_app_theme.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/data/tabIcon_data.dart';
import 'package:style_trend_talk/layout/bottom_bar_view.dart';
import 'package:style_trend_talk/pages/core/publish/publish.dart';
import 'package:style_trend_talk/pages/main/widgets/drawer/mainDrawer.dart';
// import 'package:style_trend_talk/layout/drawer_widget.dart';
// import 'package:style_trend_talk/layout/header_widget.dart';
// import 'package:style_trend_talk/layout/navigationBar.dart';
import 'package:style_trend_talk/routes/routing.dart';
import 'package:style_trend_talk/store/tab_index.dart';
import 'package:style_trend_talk/widget/customBtnRouterJump.dart';
import 'package:style_trend_talk/widget/flickr.dart';
import '../index.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final List<TabData> tabIconsList = TabData.tabsList;
  final tabIndexController = Get.put(TabIndexController());
  final index = Get.find<TabIndexController>().index;
  @override
  Widget build(BuildContext context) {
    final publishHeight = MediaQuery.of(context).size.height;
    print('publishHeight-------$publishHeight');
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const ProcesssFlicker();
                } else {
                  return Stack(
                    children: <Widget>[
                      IndexedStack(
                        index: index.value,
                        children: routing,
                      ),
                      bottomBar(context),
                      if (false) _addPush(publishHeight)
                    ],
                  );
                }
              }),
        );
      },
    );
  }

  Widget _addPush(double publishHeight) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), // 添加模糊效果
      child: Container(
        color: Colors.black.withOpacity(0.39), // 添加半透明的颜色遮罩
      ),
    );
  }

  Future<bool> getData() async {
    // await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  publish(context) {
    // Get.toNamed("/publish");

    Navigator.of(context)
        .push(CustomBottomSheetRoute(builder: (_) => PublishWidgetPage()));
  }

  Widget bottomBar(context) {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            publish(context);
          },
          changeIndex: (int index) {
            tabIndexController.setIndex(index);
          },
        ),
      ],
    );
  }
}
