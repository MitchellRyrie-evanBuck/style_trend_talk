import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:style_trend_talk/data/index.dart';
import 'package:style_trend_talk/pages/notification/controllers/controller.dart';
import 'package:style_trend_talk/pages/notification/widgets/message/index.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
import 'package:style_trend_talk/widget/refresh.dart';
import 'package:style_trend_talk/widget/flickr.dart';

class NotifierMainViewWidget extends StatefulWidget {
  const NotifierMainViewWidget({super.key});

  @override
  State<NotifierMainViewWidget> createState() => _NotifierMainViewWidgetState();
}

class _NotifierMainViewWidgetState extends State<NotifierMainViewWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 启用状态保持
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final NotificationController notificationController =
      Get.put(NotificationController());

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build

    return Scrollbar(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropMaterialHeader(
            color: Colors.white,
            distance: 30,
            semanticsValue: '',
            semanticsLabel: "努力加载中",
            backgroundColor: Color.fromARGB(255, 120, 120, 120)),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: PagedListView<int, NotifierTionListModel>.separated(
          padding: const EdgeInsets.only(bottom: 100),
          separatorBuilder: (context, index) => const SizedBox(height: 1),
          pagingController: notificationController.pagingController,
          builderDelegate: PagedChildBuilderDelegate<NotifierTionListModel>(
            firstPageProgressIndicatorBuilder: (context) =>
                const ProcesssFlicker(),
            newPageProgressIndicatorBuilder: (context) =>
                const ProcesssFlicker(),
            itemBuilder: (context, item, index) {
              print('item======================>   $item');
              return CustomMessageWidget(itemData: item);
              // return RecommendItemDetails(index: index, itemData: item);
            },
          ),
        ),
      ),
    );
  }
}
