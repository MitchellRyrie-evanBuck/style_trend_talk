import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/pages/main/controllers/recommendation.dart';
import 'package:style_trend_talk/pages/main/widgets/recommendation/index.dart';

class RecommendationPage extends GetView<RecommendationController> {
  RecommendationPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          // setState(() {
          //   items.clear();
          //   items.addAll(List.generate(
          //       20, (index) => 'Refreshed Item $index'));
          // });
        },
        child: RecommendTabPage());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendationController>(
      init: RecommendationController(),
      id: "recommendation",
      builder: (_) {
        return FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return _buildView();
              }
            });
      },
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
