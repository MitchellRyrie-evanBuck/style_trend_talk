import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/data/models/mock/recommendation.dart';
import 'package:style_trend_talk/pages/core/publish/controllers/publishControllers.dart';

class DetailsHeader extends StatefulWidget {
  const DetailsHeader({super.key, required this.data});
  final RecommendationModel data;

  @override
  State<DetailsHeader> createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MySliverPersistentHeaderDelegate(widget.data),
      pinned: true,
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this.itemData);
  final double tabHeight = 48;
  final RecommendationModel itemData;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabWidth = MediaQuery.of(context).size.width - 120;

    return Container(
        color: Colors.white,
        child: Row(
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
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'userImg-${itemData.id}',
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(itemData.userImg))),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  child: Text(
                    itemData.userName,
                    style: const TextStyle(
                        fontSize: 14,
                        color: FitnessAppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: AutofillHints.birthdayDay),
                  ),
                  //  Hero(
                  //   tag: 'userName-${itemData.id}',
                  //   child: Text(
                  //     itemData.userName,
                  //     style: const TextStyle(
                  //         fontSize: 14,
                  //         color: FitnessAppTheme.black,
                  //         fontWeight: FontWeight.w600,
                  //         fontFamily: AutofillHints.birthdayDay),
                  //   ),
                  // ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20), // 设置圆角半径，这里假设为10
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Text('关注'),
                )
              ],
            )),
            SizedBox(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.share,
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
