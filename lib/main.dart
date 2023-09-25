import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/layout/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const HomeWidget());
  }
}
