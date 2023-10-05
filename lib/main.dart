import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:style_trend_talk/layout/home.dart';
import 'package:style_trend_talk/routes/routing.dart';
import 'package:style_trend_talk/pages/index.dart';
import 'package:style_trend_talk/store/tab_index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 初始化Flutter应用
  final prefs = await SharedPreferences.getInstance();
  final isLogged = prefs.getBool('isLogged') ?? false; // 检查登录状态
  runApp(MainApp(isLogged: isLogged));
}

class MainApp extends StatelessWidget {
  MainApp({super.key, required this.isLogged});
  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: routerWidget(context),
      initialRoute: "/",
      getPages: appRoutes, // 使用路由配置文件中的路由
    );
  }

  Widget routerWidget(BuildContext context) {
    // final tabIndexController = Get.put(TabIndexController());
    final index = Get.find<TabIndexController>().index;
    return GetBuilder<TabIndexController>(
      builder: (tabIndexController) {
        print('tabIndexController.index.value: ${index}');
        return isLogged ? HomePage() : LoginPage();
      },
    );
  }
}
