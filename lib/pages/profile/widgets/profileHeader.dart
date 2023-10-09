import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';

class MyProfileSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

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
    print('shrinkOffset------${shrinkOffset}');
    print('overlapsContent------${overlapsContent}');

    // 计算滑动比例，根据需要隐藏或显示widget
    final double scrollPercentage =
        (maxExtent - shrinkOffset) / (maxExtent - minExtent);
    print('scrollPercentage-------${scrollPercentage}');

    // 根据滑动比例来控制widget的透明度
    late double opacity = 1 - scrollPercentage;
    print('opacity------${opacity}');
    if (opacity > 1) {
      opacity = 1;
    }
    if (opacity < 0) {
      opacity = 0;
    }

    return Opacity(
      opacity: 1,
      child: SizedBox.expand(child: child),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true; // 始终返回true，以便在滑动时不断重建
  }
}

class MyProfileHeader extends StatefulWidget {
  const MyProfileHeader({super.key});

  @override
  State<MyProfileHeader> createState() => _MyProfileHeaderState();
}

class _MyProfileHeaderState extends State<MyProfileHeader> {
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

  @override
  Widget build(BuildContext context) {
    queryScreenWidth = MediaQuery.of(context).size.width;
    return SliverPersistentHeader(
      delegate: MyProfileSliverPersistentHeaderDelegate(
          minHeight: 110,
          maxHeight: 320,
          child: Container(
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
            ]),
          )),
      pinned: true,
    );
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
        ));
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

  Positioned _RightBlur() {
    return Positioned(
        bottom: bottomRightDistance,
        right: 0,
        child: ClipSelfWidget(
          height: blurHeight,
          width: rightBlurWidth,
          radius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
        ));
  }

  Positioned _LeftBlur() {
    return Positioned(
        bottom: bottomLeftDistance,
        left: 0,
        child: ClipSelfWidget(
          height: blurHeight,
          width: leftBlurWidth,
          radius: const BorderRadius.only(
              topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
        ));
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
            color: const Color.fromARGB(255, 255, 255, 255)
                .withOpacity(0.2), // 调整颜色和不透明度以改变遮罩效果
          ),
        ),
      ),
    );
  }
}
