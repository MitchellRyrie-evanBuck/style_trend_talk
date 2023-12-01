import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/pages/core/publish/controllers/publishControllers.dart';

class PublishAppHeader extends StatefulWidget {
  const PublishAppHeader({
    super.key,
  });
  @override
  State<PublishAppHeader> createState() => _PublishAppHeaderState();
}

class _PublishAppHeaderState extends State<PublishAppHeader>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MySliverPersistentHeaderDelegate(),
      pinned: true,
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate();
  final double tabHeight = 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabWidth = MediaQuery.of(context).size.width - 120;

    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(fit: StackFit.expand, children: [
          Positioned(
              left: 0.0,
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.xmark),
                onPressed: () {
                  // 打开抽屉
                  Navigator.pop(context);
                },
              )),
          Positioned(
            right: 0.0,
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.seedling),
              onPressed: () {},
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     padding: const EdgeInsets.only(bottom: 3),
          //     width: tabWidth,
          //     height: tabHeight - 20,
          //     // child: const CustomPageWidget(),
          //   ),
          // )
        ]));
  }

  @override
  double get maxExtent => tabHeight;

  @override
  double get minExtent => tabHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
