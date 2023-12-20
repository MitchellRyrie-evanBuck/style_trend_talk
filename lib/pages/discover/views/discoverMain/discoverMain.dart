import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/data/models/mock/discover.dart';
import 'package:style_trend_talk/pages/discover/controllers/controller.dart';
import 'package:style_trend_talk/widget/discoverVideoWidget.dart';
import 'package:style_trend_talk/widget/keepAliveWrapper.dart';
import 'package:style_trend_talk/widget/videoWidget.dart';

class DiscoverMainTabPage extends StatefulWidget {
  const DiscoverMainTabPage({super.key});

  @override
  State<DiscoverMainTabPage> createState() => _DiscoverMainTabPageState();
}

class _DiscoverMainTabPageState extends State<DiscoverMainTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 启用状态保持

  final discoverController = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (ScrollUpdateNotification scrollInfo) {
        // 滑动距离
        double scrollDistance = scrollInfo.metrics.pixels;

        // 页面的高度
        double pageHeight = scrollInfo.metrics.maxScrollExtent;

        // 判断是否滑动到底部
        if (scrollDistance >= pageHeight) {
          // Reach the bottom of the page, load more data
          discoverController.getDiscoverInfoList();
          return true;
        }
        return false;
      },
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: discoverController.discoverList.length,
        itemBuilder: (context, index) {
          return KeepAliveWrapper(
            keepAlive: true,
            child: DiscoverControllerWidget(
              info: discoverController.discoverList[index],
            ),
          );
        },
      ),
    );
    // return PageView.builder(
    //   // controller: discoverController.tabPageController,
    //   scrollDirection: Axis.vertical,
    //   itemCount: discoverController.discoverList.length, // 页面数量，假设有10个视频
    //   itemBuilder: (context, index) {
    //     return const KeepAliveWrapper(
    //       // 为 true 后会缓存所有的列表项，列表项将不会销毁。
    //       // 为 false 时，列表项滑出预加载区域后将会别销毁。
    //       // 使用时一定要注意是否必要，因为对所有列表项都缓存的会导致更多的内存消耗

    //       keepAlive: true,
    //       child: DiscoverControllerWidget(),
    //     );
    //   },
    // );
  }
}

class DiscoverControllerWidget extends StatelessWidget {
  const DiscoverControllerWidget({super.key, required this.info});
  final DiscoverModel info;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DiscoverVideoComponent(
              videoPath: info.video as String, id: info.id),
        ),
        // Center(
        //   child: Text(
        //     info.userName,
        //     style: const TextStyle(color: FitnessAppTheme.white),
        //   ),
        // )
      ],
    );
  }
}
