import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/pages/index.dart';

class CustomDiscoverTabBarWidget extends StatelessWidget {
  CustomDiscoverTabBarWidget(
      {super.key,
      required this.tabController,
      required this.discoverListTabName});

  final TabController tabController;
  final List<String> discoverListTabName;
  final discoverController = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.black,
      isScrollable: true,
      indicatorWeight: 0,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
            width: 2,
          ),
        ),
      ),
      dividerColor: Colors.transparent,
      labelColor: const Color.fromARGB(255, 255, 255, 255),
      unselectedLabelColor: const Color.fromARGB(255, 162, 162, 162),
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      mouseCursor: MouseCursor.defer,
      enableFeedback: false,
      onTap: (index) {
        discoverController.setIndex(index);
      },
      physics: const BouncingScrollPhysics(),
      splashFactory: InkSplash.splashFactory,
      splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
      tabAlignment: TabAlignment.center,
      tabs: discoverListTabName.asMap().entries.map((entry) {
        final int index = entry.key;
        return Tab(
          child: Container(
            child: Stack(
              children: [
                Center(
                  child: Text(discoverListTabName[index]),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
