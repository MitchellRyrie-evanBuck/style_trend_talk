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
          child: SizedBox(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  GestureDetector(
                    onTap: () {
                      // 点击按钮时显示评论框
                      _showCommentSheet(context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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

  // 显示评论框
  void _showCommentSheet(BuildContext context) {
    var sheetHeight = MediaQuery.of(context).size.height;
    var sheetWidth = MediaQuery.of(context).size.width;
    TextEditingController controller = TextEditingController();
    var sheetCommentHeight = (sheetHeight / 2) + 50;
    var showComment = true;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
      builder: (BuildContext context) {
        return Container(
          height: sheetCommentHeight,
          width: sheetWidth,
          child: Column(
            children: [
              Container(
                width: sheetWidth,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6,
                      width: 38,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 92, 92, 92),
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '评论',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              ),
              Expanded(
                child: showComment
                    ? _commentContainer()
                    : Container(
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '还没有评论',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              Text(
                                '开始评论',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 87, 87, 87),
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
              CommentAlign(controller: controller),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _commentContainer() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(30, (index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
          );
        }),
      ),
    );
  }
}

class CommentAlign extends StatelessWidget {
  const CommentAlign({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile/user.png'))),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 233, 233), // 设置背景色
                    borderRadius: BorderRadius.circular(20.0), // 设置圆角（可选）
                  ),
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '善语结善缘，恶语伤人心.',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                      contentPadding:
                          const EdgeInsets.only(top: 2, left: 24, right: 0),
                      suffixIconConstraints:
                          const BoxConstraints.tightFor(width: 40),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.circleUp,
                          color: Color.fromARGB(255, 82, 82, 82),
                          size: 20,
                        ),
                        onPressed: () {
                          print('Searching for: ${_controller.text}');
                        },
                      ),
                    ),
                    onSubmitted: (text) {
                      // Handle search action here as well
                      print('Searching for: $text');
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Icon(FontAwesomeIcons.gift)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
