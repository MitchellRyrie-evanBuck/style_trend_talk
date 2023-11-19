import 'package:flutter/material.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';

class DiscoverMainTabPage extends StatefulWidget {
  const DiscoverMainTabPage({super.key});

  @override
  State<DiscoverMainTabPage> createState() => _DiscoverMainTabPageState();
}

class _DiscoverMainTabPageState extends State<DiscoverMainTabPage> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // controller: discoverController.tabPageController,
      scrollDirection: Axis.vertical,
      itemCount: 10, // 页面数量，假设有10个视频
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            'DiscoverMainTabPage-${index}',
            style: const TextStyle(color: FitnessAppTheme.white),
          ),
        );
      },
    );
  }
}
