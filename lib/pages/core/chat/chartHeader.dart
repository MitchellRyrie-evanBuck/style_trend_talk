import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';

class ChartHeader extends StatefulWidget {
  const ChartHeader({super.key});
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
    return Container(
        color: const Color.fromARGB(0, 255, 255, 255),
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
    return Stack(
      children: [
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 54,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        navigator?.pop(context);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: 18,
                        color: Color.fromARGB(255, 142, 39, 207),
                      )),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/profile/user.png'))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Mitchell Ryrie',
                    style: TextStyle(
                        color: FitnessAppTheme.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 50,
                    child: Icon(
                      FontAwesomeIcons.phone,
                      size: 20,
                      color: Color.fromARGB(255, 142, 39, 207),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                    child: Icon(
                      FontAwesomeIcons.video,
                      size: 20,
                      color: Color.fromARGB(255, 142, 39, 207),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
