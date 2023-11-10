import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/layout/drawer_widget.dart';
import 'package:style_trend_talk/layout/header_widget.dart';
import 'package:style_trend_talk/layout/navigationBar.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      body: Container(
        width: 200,
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const NavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: IconButton(
        icon: const Icon(FontAwesomeIcons.userCircle),
        onPressed: () {
          // 点击菜单按钮的回调函数
        },
      ),
    );
  }
}
