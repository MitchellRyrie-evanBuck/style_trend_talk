import 'package:flutter/material.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/widget/keepAliveWrapper.dart';

class DiscoverMainTabPage extends StatefulWidget {
  const DiscoverMainTabPage({super.key});

  @override
  State<DiscoverMainTabPage> createState() => _DiscoverMainTabPageState();
}

class _DiscoverMainTabPageState extends State<DiscoverMainTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 启用状态保持

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build

    return PageView.builder(
      // controller: discoverController.tabPageController,
      scrollDirection: Axis.vertical,
      itemCount: 10, // 页面数量，假设有10个视频
      itemBuilder: (context, index) {
        return KeepAliveWrapper(
          // 为 true 后会缓存所有的列表项，列表项将不会销毁。
          // 为 false 时，列表项滑出预加载区域后将会别销毁。
          // 使用时一定要注意是否必要，因为对所有列表项都缓存的会导致更多的内存消耗
          //TODO进行预加载  当滑动到距离最后数组长度距离为1时 提前加载请求数据的接口
          keepAlive: true,
          child: Center(
            child: Text(
              'DiscoverMainTabPage-${index}',
              style: const TextStyle(color: FitnessAppTheme.white),
            ),
          ),
        );
      },
    );
  }
}
