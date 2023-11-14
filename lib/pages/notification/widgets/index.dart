// import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:style_trend_talk/data/index.dart';
import 'package:style_trend_talk/pages/notification/controllers/controller.dart';
import 'package:style_trend_talk/pages/notification/widgets/message/index.dart';
// import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
// import 'package:style_trend_talk/widget/refresh.dart';
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

  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build

    return customPageList();
  }

  Widget customPageList() {
    return PagedSliverList<int, NotifierTionListModel>.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      pagingController: notificationController.pagingController,
      builderDelegate: PagedChildBuilderDelegate<NotifierTionListModel>(
        firstPageProgressIndicatorBuilder: (context) => const ProcesssFlicker(),
        newPageProgressIndicatorBuilder: (context) => const ProcesssFlicker(),
        itemBuilder: (context, item, index) {
          print('item======================>   $item');
          return CustomMessageWidget(itemData: item);
          // return RecommendItemDetails(index: index, itemData: item);
        },
      ),
    );
  }
}
