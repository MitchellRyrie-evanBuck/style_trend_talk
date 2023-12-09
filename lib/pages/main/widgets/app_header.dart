import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/pages/index.dart';
import 'package:style_trend_talk/pages/main/controllers/controller.dart';

List<String> listTabName = ['推荐', '关注', '直播', '广场', '同城'];

class HomeAppHeader extends StatefulWidget {
  const HomeAppHeader({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  State<HomeAppHeader> createState() => _HomeAppHeaderState();
}

class _HomeAppHeaderState extends State<HomeAppHeader>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animatedContainer;

  @override
  void initState() {
    // _animatedContainer = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SliverPersistentHeader(
      delegate:
          MySliverPersistentHeaderDelegate(screenWidth, widget.tabController),
      pinned: true,
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this.screenWidth, this.tabController);

  final double screenWidth;
  final double tabHeight = 48;
  final TabController tabController;

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
          color: Colors.transparent,
          child: Stack(fit: StackFit.expand, children: [
            Positioned(
                left: 0.0,
                child: IconButton(
                  icon: const Icon(Icons.bolt),
                  // icon: const Icon(FontAwesomeIcons.sliders, size: 16),

                  onPressed: () {
                    // 打开抽屉
                    // Scaffold.of(context).openDrawer();
                    Get.to(
                      const TrendPage(),
                      // transition: Transition.circularReveal,
                      transition: Transition.leftToRightWithFade,
                    );
                  },
                )),
            Positioned(
              right: 0.0,
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // 执行搜索操作
                  Get.toNamed("/search");
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.only(bottom: 3),
                width: tabWidth,
                height: tabHeight - 20,
                child: CustomTabBarWidget(tabController: tabController),
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
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        id: "main",
        builder: (_) {
          return Stack(
            children: [
              ListView.separated(
                  padding: const EdgeInsets.only(top: 3),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 30),
                  scrollDirection: Axis.horizontal,
                  itemCount: listTabName.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                          child: Text(
                        listTabName[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: index == mainController.currentIndex.value
                                ? Colors.black
                                : Colors.grey),
                      )),
                      onTap: () {
                        mainController.setIndex(index);
                      },
                    );
                  }),
              AnimatedPositioned(
                  left: 0,
                  bottom: 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    height: 2,
                    width: 30,
                    color: Colors.black,
                  ))
            ],
          );
        });

    // Row(
    // mainAxisAlignment: MainAxisAlignment.center,
    // children: listTabName.asMap().entries.map((entry) {
    //   final int index = entry.key;
    //   return GestureDetector(
    //     child: Container(
    //         margin: EdgeInsets.symmetric(horizontal: 10),
    //         child: Text(listTabName[index])),
    //     onTap: () {
    //       mainController.setIndex(index);
    //     },
    //   );
    // }).toList(),
    // );
  }
}

class CustomTabBarWidget extends StatelessWidget {
  CustomTabBarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.black,
      isScrollable: true,
      indicatorWeight: 0,
      // indicatorPadding: EdgeInsets.zero,
      // indicatorPadding:
      //     EdgeInsets.only(left: 15, right: currentIndicatorPadding),
      indicatorSize: TabBarIndicatorSize.label,
      // indicatorSize: TabBarIndicatorSize.tab,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      // indicator: AnimatedTabBarIndicator(listenable: _animatedContainer),
      dividerColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      mouseCursor: MouseCursor.defer,
      enableFeedback: false,
      onTap: (index) {
        mainController.setIndex(index);
      },

      physics: const BouncingScrollPhysics(),
      splashFactory: InkSplash.splashFactory,
      splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
      tabAlignment: TabAlignment.center,
      tabs: listTabName.asMap().entries.map((entry) {
        final int index = entry.key;
        return Tab(
          child: Container(
            child: Stack(
              children: [
                Center(
                  child: Text(listTabName[index]),
                ),
                // Positioned(
                //     top: 0,
                //     right: 0,
                //     child: Container(
                //       height: 20,
                //       width: 20,
                //       decoration: const BoxDecoration(
                //           color: Color.fromARGB(255, 255, 16, 16),
                //           borderRadius: BorderRadius.all(Radius.circular(10))),
                //       child: const Text(
                //         '99',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ))
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// class AnimatedTabBarIndicator extends AnimatedWidget implements Decoration {
//   AnimatedTabBarIndicator({Key key}) : super(key: key, listenable: _animation);

//   final Animation<double> _animation = Tween<double>(
//     begin: 0.0, // 初始长度
//     end: 1.0, // 最大长度
//   ).animate(CurvedAnimation(
//     parent: _controller,
//     curve: Curves.ease,
//   ));

//   static AnimationController _controller = AnimationController(
//     duration: Duration(milliseconds: 300),
//     vsync: ScrollableState(),
//   );

//   @override
//   BoxPainter createBoxPainter([VoidCallback onChanged]) {
//     return _AnimatedIndicatorPainter(
//       animation: _animation,
//       onChanged: onChanged,
//     );
//   }

//   @override
//   EdgeInsetsGeometry get padding => EdgeInsets.zero;

//   @override
//   ShapeBorder? get shape => RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0), // 圆角
//       );

//   @override
//   bool? get isComplex => false;

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

//   @override
//   bool hitTest(Size size, Offset position, {TextDirection? textDirection}) {
//     return false;
//   }
// }

// class _AnimatedIndicatorPainter extends BoxPainter {
//   _AnimatedIndicatorPainter({
//     required Animation<double> animation,
//     VoidCallback? onChanged,
//   })  : _animation = animation,
//         super(repaint: animation);

//   final Animation<double> _animation;

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     final Rect rect = offset & configuration.size!;
//     final Paint paint = Paint();
//     paint.color = Colors.blue; // 指示器颜色
//     final double indicatorWidth = rect.width * _animation.value;
//     final double centerX = rect.center.dx;
//     final double left = centerX - indicatorWidth / 2;
//     final double right = centerX + indicatorWidth / 2;
//     final Rect indicatorRect =
//         Rect.fromLTRB(left, rect.top, right, rect.bottom);
//     final RRect indicatorRRect = RRect.fromRectAndRadius(
//       indicatorRect,
//       Radius.circular(10.0), // 圆角
//     );
//     canvas.drawRRect(indicatorRRect, paint);
//   }
// }
