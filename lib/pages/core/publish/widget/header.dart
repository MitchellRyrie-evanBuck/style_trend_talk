import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
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
  final double tabHeight = 48;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabWidth = MediaQuery.of(context).size.width - 120;

    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: IconButton(
                  onPressed: () {
                    navigator?.pop(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    size: 18,
                  )),
            ),
            const SizedBox(
              child: Text(
                '不期而遇',
                style: TextStyle(
                    color: FitnessAppTheme.black, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.poo,
                    size: 18,
                  )),
            ),
          ],
        ));
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
