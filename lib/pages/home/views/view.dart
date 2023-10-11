import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/data/tabIcon_data.dart';
import 'package:style_trend_talk/layout/bottom_bar_view.dart';
// import 'package:style_trend_talk/layout/drawer_widget.dart';
// import 'package:style_trend_talk/layout/header_widget.dart';
// import 'package:style_trend_talk/layout/navigationBar.dart';
import 'package:style_trend_talk/routes/routing.dart';
import 'package:style_trend_talk/store/tab_index.dart';
import '../index.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final List<TabData> tabIconsList = TabData.tabsList;
  final tabIndexController = Get.put(TabIndexController());
  final index = Get.find<TabIndexController>().index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return Stack(
                    children: <Widget>[
                      routing[index.value],
                      bottomBar(),
                    ],
                  );
                }
              }),
        );
      },
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            tabIndexController.setIndex(index);
          },
        ),
      ],
    );
  }
}
