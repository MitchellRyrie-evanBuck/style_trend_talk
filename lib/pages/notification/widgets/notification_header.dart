import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/pages/index.dart';
import 'package:style_trend_talk/pages/main/controllers/controller.dart';

class NotificationAppHeader extends StatefulWidget {
  const NotificationAppHeader({
    super.key,
  });
  @override
  State<NotificationAppHeader> createState() => _NotificationAppHeaderState();
}

class _NotificationAppHeaderState extends State<NotificationAppHeader>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SliverPersistentHeader(
      delegate: MySliverPersistentHeaderDelegate(screenWidth),
      pinned: true,
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(
    this.screenWidth,
  );

  final double screenWidth;
  final double tabHeight = 45;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabWidth = screenWidth - 120;
    // final double screenPadding = (screenWidth / 2 - tabWidth / 2) + 10;

    // final mainController = Get.put(MainController());

    return GetBuilder<MainController>(builder: (controller) {
      // final double currentIndicatorPadding =
      //     mainController.indicatorPadding.value;

      // print('currentIndicatorPadding---${currentIndicatorPadding}');
      return Container(
          color: Colors.white,
          child: Stack(fit: StackFit.expand, children: [
            Positioned(
                left: 0.0,
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.bars,
                    size: 18,
                  ),
                  onPressed: () {
                    // 打开抽屉
                  },
                )),
            Positioned(
              right: 0.0,
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.solidPaperPlane,
                  size: 18,
                ),
                onPressed: () {
                  // 执行搜索操作
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.only(bottom: 0),
                width: tabWidth,
                height: tabHeight,
                child: const CustomPageWidget(),
                // child: const CustomPageWidget(),
              ),
            )
          ]));
    });
  }

  @override
  double get maxExtent => tabHeight;

  @override
  double get minExtent => tabHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CustomPageWidget extends StatefulWidget {
  const CustomPageWidget({super.key});

  @override
  State<CustomPageWidget> createState() => _CustomPageWidgetState();
}

class _CustomPageWidgetState extends State<CustomPageWidget> {
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        id: "notification",
        builder: (_) {
          return const Stack(
            children: [
              Center(
                child: Text(
                  '消息',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              )
            ],
          );
        });
  }
}
