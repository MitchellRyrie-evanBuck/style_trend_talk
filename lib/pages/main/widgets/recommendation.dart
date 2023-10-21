import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/index.dart';
import 'package:style_trend_talk/pages/main/controllers/recommendation.dart';
import 'package:style_trend_talk/pages/main/widgets/recommendation/index.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';

class RecommendationPage extends GetView<RecommendationController> {
  const RecommendationPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          // setState(() {
          //   items.clear();
          //   items.addAll(List.generate(
          //       20, (index) => 'Refreshed Item $index'));
          // });
        },
        child: const RecommendTabPage());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendationController>(
      init: RecommendationController(),
      id: "recommendation",
      builder: (_) {
        return FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressIndicatorWidget();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final data = snapshot.data;
                return _buildView();
              }
            });
      },
    );
  }

  Future getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    // recommendationList
    return recommendationList;
  }
}
