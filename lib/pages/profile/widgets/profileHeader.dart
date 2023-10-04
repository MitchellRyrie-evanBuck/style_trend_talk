import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    print('scrollPercentage------${scrollPercentage}');

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
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MyProfileSliverPersistentHeaderDelegate(
          minHeight: 100,
          maxHeight: 180,
          child: Container(
            height: 180,
            width: MediaQuery.of(Get.context!).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/profile/profile.png'),
                  fit: BoxFit.cover),
            ),
          )),
      pinned: true,
    );
  }
}
