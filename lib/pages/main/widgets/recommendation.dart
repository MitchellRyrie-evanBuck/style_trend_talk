import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:style_trend_talk/data/index.dart';
import 'package:style_trend_talk/pages/main/controllers/controller.dart';
import 'package:style_trend_talk/pages/main/controllers/recommendation.dart';
import 'package:style_trend_talk/pages/main/widgets/recommendation/index.dart';
import 'package:style_trend_talk/widget/flickr.dart';
// import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';

class RecommendationPageMiddle extends StatefulWidget {
  const RecommendationPageMiddle({super.key});

  @override
  State<RecommendationPageMiddle> createState() =>
      _RecommendationPageMiddleState();
}

class _RecommendationPageMiddleState extends State<RecommendationPageMiddle>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 启用状态保持

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build
    return RecommendationPage();
  }
}

class RecommendationPage extends GetView<RecommendationController> {
  RecommendationPage({Key? key}) : super(key: key);
  final mainController = Get.put(MainController());

  // 主视图
  Widget _buildView() {
    return const RecommendTabPage();
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
                return const ProcesssFlicker();
              } else if (snapshot.hasError) {
                return Text('Error--: ${snapshot.error}');
              } else {
                // final data = snapshot.data;
                return _buildView();
              }
            });
      },
    );
  }

  Future getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
    // recommendationList
    // return recommendationList;
  }
}
