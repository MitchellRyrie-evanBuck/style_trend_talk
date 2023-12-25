import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
// import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/data/models/mock/discover.dart';
import 'package:style_trend_talk/pages/discover/controllers/controller.dart';
import 'package:style_trend_talk/widget/discoverVideoWidget.dart';
import 'package:style_trend_talk/widget/keepAliveWrapper.dart';
// import 'package:style_trend_talk/widget/videoWidget.dart';

TextStyle textStyleForVideo = const TextStyle(
    color: FitnessAppTheme.white, fontSize: 15, fontWeight: FontWeight.w500);

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
              child: Container(
                color: Colors.amber,
                child: DiscoverControllerWidget(
                  info: discoverController.discoverList[index],
                ),
              ));
        },
      ),
    );
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
        Positioned(
          right: 0,
          bottom: 60,
          child: Container(
            // height: 330,
            width: 70,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 55,
                    child: Stack(children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/profile/user.png'))),
                      ),
                      Positioned(
                          top: 35,
                          left: 13,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                              size: 15,
                            ),
                          ))
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.red,
                        size: 32,
                      ),
                      Text(
                        '11.1k',
                        style: textStyleForVideo,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidCommentDots,
                        color: Colors.white,
                        size: 32,
                      ),
                      Text(
                        '11.1k',
                        style: textStyleForVideo,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.white,
                        size: 32,
                      ),
                      Text(
                        '11.1k',
                        style: textStyleForVideo,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  Column(
                    children: [
                      const Icon(
                        FontAwesomeIcons.share,
                        color: Colors.white,
                        size: 32,
                      ),
                      Text(
                        '11.1k',
                        style: textStyleForVideo,
                      )
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Icon(
                  //   FontAwesomeIcons.heartCrack,
                  //   color: Colors.white,
                  //   size: 32,
                  // ),
                ]),
          ),
        )
      ],
    );
  }
}
