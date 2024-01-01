import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';

class ChartHeader extends StatefulWidget {
  const ChartHeader();
  @override
  State<ChartHeader> createState() => ChartHeaderState();
}

class ChartHeaderState extends State<ChartHeader>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: ChartForSliverPersistentHeaderDelegate(
        minHeight: 110,
        maxHeight: 110,
        child:
            (BuildContext context, double shrinkOffset, bool overlapsContent) {
          return ChartMessageController(
            shrinkOffset: shrinkOffset,
            overlapsContent: overlapsContent,
          );
        },
      ),
      pinned: true,
    );
  }
}

class ChartForSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Function child;

  ChartForSliverPersistentHeaderDelegate({
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
    return SizedBox.expand(
        child: child(context, shrinkOffset, overlapsContent));
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true; // 始终返回true，以便在滑动时不断重建
  }
}

class ChartMessageController extends StatefulWidget {
  const ChartMessageController(
      {super.key, required this.shrinkOffset, required this.overlapsContent});

  final double shrinkOffset;
  final bool overlapsContent;

  @override
  State<ChartMessageController> createState() => _ChartMessageControllerState();
}

class _ChartMessageControllerState extends State<ChartMessageController> {
  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final queryScreenWidth = MediaQuery.of(context).size.width;
    print('shrinkOffset==============${widget.shrinkOffset}');
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 54,
              color: Colors.blueAccent,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        navigator?.pop(context);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        size: 18,
                      )),
                ],
              ),
            ))
      ],
    );
  }
}
