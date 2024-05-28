import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:style_trend_talk/layout/home.dart';
import 'package:style_trend_talk/routes/routing.dart';
import 'package:style_trend_talk/pages/index.dart';
import 'package:style_trend_talk/store/tab_index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLogged = prefs.getBool('isLogged') ?? false; // 检查登录状态
  runApp(MainApp(isLogged: isLogged));
}

class MainApp extends StatelessWidget {
  MainApp({super.key, required this.isLogged});
  final bool isLogged;
  final tabIndexController = Get.put(TabIndexController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: routerWidget(context),
      initialRoute: "/",
      getPages: appRoutes,
    );
  }

  Widget routerWidget(BuildContext context) {
    return GetBuilder<TabIndexController>(
      builder: (tabIndexController) {
        // print('tabIndexController.index.value: ${index}');
        return isLogged ? HomePage() : LoginPage();
      },
    );
  }
}
