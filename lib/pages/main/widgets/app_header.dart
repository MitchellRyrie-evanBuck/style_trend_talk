import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppHeader extends StatefulWidget {
  const HomeAppHeader({super.key});

  @override
  State<HomeAppHeader> createState() => _HomeAppHeaderState();
}

class _HomeAppHeaderState extends State<HomeAppHeader> {
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
  MySliverPersistentHeaderDelegate(this.screenWidth);

  final double screenWidth;
  final double tabHeight = 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabWidth = screenWidth - 120;
    final double screenPadding = screenWidth / 2 - tabWidth / 2;
    return Container(
        color: Colors.transparent,
        child: Stack(fit: StackFit.expand, children: [
          Positioned(
              left: 0.0,
              child: Container(
                child: IconButton(
                  icon: const Icon(Icons.bolt),
                  onPressed: () {
                    // 打开抽屉
                  },
                ),
              )),
          Positioned(
            right: 0.0,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // 执行搜索操作
              },
            ),
          ),
          Positioned(
            left: screenPadding,
            top: 10,
            child: Container(
              width: tabWidth,
              height: tabHeight - 20,
              child: TabBar(
                indicatorColor: Colors.black,
                isScrollable: true,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.zero,
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.transparent; // 当按下时设置为红色
                    }
                    return Colors.transparent; // 其他状态设置为蓝色
                  },
                ),
                mouseCursor: MouseCursor.defer,
                enableFeedback: false,
                onTap: (index) {
                  print('object---${index}');
                  // 切换tab
                },
                physics: const BouncingScrollPhysics(),
                splashFactory: InkSplash.splashFactory,
                splashBorderRadius: BorderRadius.all(Radius.circular(10)),
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    child: Container(
                      child: const Center(
                        child: Text("推荐"),
                      ),
                    ),
                  ),
                  Tab(
                    height: 30,
                    child: Container(
                      child: const Center(
                        child: Text("关注"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Center(
                        child: Text("直播"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Center(
                        child: Text("广场"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: const Center(
                        child: Text("同城"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
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
