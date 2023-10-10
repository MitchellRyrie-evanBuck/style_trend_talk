import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';

class MyProfileSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Function child;

  MyProfileSliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Opacity(
      opacity: 1,
      child:
          SizedBox.expand(child: child(context, shrinkOffset, overlapsContent)),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true; // 始终返回true，以便在滑动时不断重建
  }
}

class MyProfileHeader extends StatefulWidget {
  const MyProfileHeader(
      {super.key, required this.scrollController, required this.callBack});
  final ScrollController scrollController;
  final void Function(String) callBack;
  @override
  State<MyProfileHeader> createState() => MyProfileHeaderState();
}

class MyProfileHeaderState extends State<MyProfileHeader>
    with SingleTickerProviderStateMixin {
  final double minHeight = 110;
  final double maxHeight = 320;

  final double bottomLeftDistance = 150.0;
  final double bottomRightDistance = 120.0;
  final double blurHeight = 70.0;
  final double shadowHeight = 150.0;
  final double userBottomHeight = 155.0;
  final double starBottomHeight = 130.0;
  final double rightBlurWidth = 200.0;
  final double leftBlurWidth = 100.0;
  // 获取视窗宽度
  late double queryScreenWidth = 0;
  final double queryUserDescWidth = 380;
  double widgetOpacity = 0;
  final Duration duration = const Duration(milliseconds: 500);
  // --------------------------
  double animatedLeftBlur = -100.0;
  // --------------------------
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: duration, // 可根据需要调整动画持续时间
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0, // 开始透明度
      end: 0.0, // 结束透明度
    ).animate(_animationController);
// 监听滚动
    // widget.scrollController.addListener(() {
    //   final offset = widget.scrollController.offset;

    //   if (offset >= 0 && offset <= 100) {
    //     // 在 0 到 200 的范围内计算透明度
    //     final opacity = 1.0 - (offset / 100.0);

    //     // 更新透明度动画的值
    //     _opacityAnimation = Tween<double>(
    //       begin: _opacityAnimation.value, // 保持当前值
    //       end: opacity,
    //     ).animate(_animationController);

    //     // 播放动画
    //     _animationController.forward();
    //   } else {
    //     // 当滚动超过 200 时，反向播放透明度动画
    //     _animationController.reverse();
    //   }
    // });
    // 在页面加载后，通过定时器来控制Container移入和透明度递增
    Future.delayed(duration, () {
      setState(() {
        animatedLeftBlur = 0; // 移入到视图内部
        widgetOpacity = 1.0; // 透明度递增到1
      });
    });

    // 控制上滑组件的移出和透明度降低
    Future.delayed(Duration(milliseconds: 1500), () {
      // setState(() {
      //   slideOutPosition = -100.0; // 移出到视图外部
      // });
    });
  }

  void tipValue(double value) {
    // print('************************************$value');
  }

  Future<void> setOpacity(
    double shrinkOffset,
  ) async {
    final offset = shrinkOffset;
    if (offset >= 0 && offset <= 100) {
      // 在 0 到 200 的范围内计算透明度
      final opacity = 1.0 - (offset / 100.0);
      print('**************offset***************$offset');

      print('**************opacity***************$opacity');
      // 更新透明度动画的值
      _opacityAnimation = Tween<double>(
        begin: _opacityAnimation.value, // 保持当前值
        end: opacity,
      ).animate(_animationController);

      // 播放动画
      _animationController.forward();
    } else {
      // 当滚动超过 200 时，反向播放透明度动画
      _animationController.reverse();
    }
    // print('MyProfileHeader----------opacity--------------${opacity}');
  }

  @override
  Widget build(BuildContext context) {
    queryScreenWidth = MediaQuery.of(context).size.width;
    return SliverPersistentHeader(
      delegate: MyProfileSliverPersistentHeaderDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        child:
            (BuildContext context, double shrinkOffset, bool overlapsContent) {
          // setOpacity(shrinkOffset);
          return _ProfileController();
        },
      ),
      pinned: true,
    );
  }

  Container _ProfileController() {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/profile/profile.png'),
              fit: BoxFit.cover),
        ),
        child: Stack(children: [
          _LeftBlur(),
          _RightBlur(),
          _BottomGradient(),
          _UserImg(),
          _UserImgAdd(),
          _UserProfileStar(),
          _PersonalSignature(),
          _UserDes(),
          _UserMoreProfile()
        ]));
  }

  Positioned _UserMoreProfile() {
    return Positioned(
        bottom: 10,
        left: (queryScreenWidth - queryUserDescWidth) / 2,
        child: ClipSelfWidget(
            height: 80,
            width: queryUserDescWidth,
            radius: const BorderRadius.all(Radius.circular(10))));
  }

  Positioned _UserDes() {
    return Positioned(
        bottom: userBottomHeight,
        left: 110,
        child: Container(
          height: 50,
          alignment: Alignment.centerLeft,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AFL',
                style: TextStyle(
                    fontFamily: FitnessAppTheme.fontName,
                    color: FitnessAppTheme.nearlyWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text('@: 3434343443',
                  style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      color: FitnessAppTheme.nearlyWhite,
                      fontSize: 11,
                      fontWeight: FontWeight.w600))
            ],
          ),
        ));
  }

  Positioned _PersonalSignature() {
    return Positioned(
        bottom: 110,
        left: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            '有志者事竟成',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  Positioned _UserProfileStar() {
    return Positioned(
        right: 10,
        bottom: starBottomHeight,
        child: Container(
          width: 170,
          height: 50,
          child: Row(
            children: [_StartOrFlow()],
          ),
        ));
  }

  Container _StartOrFlow() {
    return Container(
      width: 170,
      height: 50,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '关注',
                style: FitnessAppTheme.playFair,
              ),
              Text(
                '11k',
                style: FitnessAppTheme.playFair,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '粉丝',
                style: FitnessAppTheme.playFair,
              ),
              Text(
                '11k',
                style: FitnessAppTheme.playFair,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '获赞',
                style: FitnessAppTheme.playFair,
              ),
              Text(
                '11k',
                style: FitnessAppTheme.playFair,
              ),
            ],
          )
        ],
      ),
    );
  }

  Positioned _UserImgAdd() {
    return Positioned(
        bottom: userBottomHeight,
        left: 22,
        child: Container(
          height: 22,
          width: 22,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: const Icon(
            FontAwesomeIcons.add,
            color: Colors.white,
            size: 16,
          ),
        ));
  }

  Positioned _UserImg() {
    return Positioned(
        bottom: userBottomHeight,
        left: 33,
        child: AnimatedOpacity(
            duration: duration,
            // opacity: _opacityAnimation.value,
            opacity: 1,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/profile/user.png'))),
            )));
  }

  Positioned _BottomGradient() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: shadowHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter, // 从底部开始
              end: Alignment.topCenter, // 渐变到顶部
              colors: [
                Colors.black, // 底部颜色
                Colors.transparent, // 中间透明
              ],
            ),
          ),
        ));
  }

  AnimatedPositioned _RightBlur() {
    return AnimatedPositioned(
        duration: duration,
        bottom: bottomRightDistance,
        right: 0,
        child: AnimatedOpacity(
            duration: duration,
            // opacity: _opacityAnimation.value,
            opacity: 1,
            child: ClipSelfWidget(
              height: blurHeight,
              width: rightBlurWidth,
              radius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            )));
  }

  AnimatedPositioned _LeftBlur() {
    return AnimatedPositioned(
        duration: duration,
        bottom: bottomLeftDistance,
        left: animatedLeftBlur,
        child: AnimatedOpacity(
            duration: duration,
            // opacity: _opacityAnimation.value,
            opacity: 1,
            child: ClipSelfWidget(
              height: blurHeight,
              width: leftBlurWidth,
              radius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            )));
  }
}

class ClipSelfWidget extends StatefulWidget {
  const ClipSelfWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});
  final double width;
  final double height;
  final BorderRadiusGeometry radius;

  @override
  State<ClipSelfWidget> createState() => _ClipSelfWidgetState();
}

class _ClipSelfWidgetState extends State<ClipSelfWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.radius, // 可以设置圆角
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // 调整sigma值以改变模糊程度
          child: Container(
            color: Color.fromARGB(255, 168, 168, 168)
                .withOpacity(0.38), // 调整颜色和不透明度以改变遮罩效果
          ),
        ),
      ),
    );
  }
}
