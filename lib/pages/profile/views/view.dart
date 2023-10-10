import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/main_tab.dart';
import 'package:style_trend_talk/pages/profile/widgets/profileHeader.dart';

import '../index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ProfileContainerWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }
}

class ProfileContainerWidget extends StatefulWidget {
  const ProfileContainerWidget({super.key});

  @override
  State<ProfileContainerWidget> createState() => _ProfileContainerWidgetState();
}

class _ProfileContainerWidgetState extends State<ProfileContainerWidget>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController _profileContainerWidgetStateController;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerFn);
    _profileContainerWidgetStateController =
        TabController(length: listTabs.length, vsync: this);
    _profileContainerWidgetStateController
        .addListener(profileContainerWidgetStateControllerFn);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollControllerFn() {
    // print('scrollController----${scrollController.offset}');
  }

  void profileContainerWidgetStateControllerFn() {
    print(
        'profileContainerWidgetStateControllerFn----${_profileContainerWidgetStateController.index}');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: listTabs.length,
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            const MyProfileHeader(),
            _MyProfileDesc(listProfile),
            SliverPersistentHeader(
              delegate: MySliverTabBarHeaderDelegate(
                  _profileContainerWidgetStateController),
              pinned: true,
            ),
            _MyProfileContext()
          ],
        ));
    // );
  }

  Widget _MyProfileContext() {
    return SliverFillRemaining(
      child: TabBarView(
        controller: _profileContainerWidgetStateController,
        children: listWidgets,
      ),
    );
  }

  Widget _MyProfileLife() {
    return SliverPersistentHeader(
      delegate:
          MySliverTabBarHeaderDelegate(_profileContainerWidgetStateController),
      pinned: true,
    );
  }

  SliverList _MyProfileDesc(List<Map<String, dynamic>> listProfile) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: 50,
            color: const Color.fromARGB(255, 255, 255, 255),
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  listProfile[index]['icon'],
                  color: Color.fromARGB(255, 151, 151, 151),
                  size: 14,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(listProfile[index]['name'],
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 2, 2, 2),
                                fontWeight: FontWeight.w500)),
                        Text(listProfile[index]['title'],
                            style: const TextStyle(
                                fontSize: 11,
                                color: Color.fromARGB(255, 151, 151, 151))),
                      ]),
                ),
                const SizedBox(width: 5),
                const Icon(FontAwesomeIcons.angleRight,
                    size: 14, color: Color.fromARGB(255, 151, 151, 151))
              ],
            ),
          );
        },
        childCount: listProfile.length,
      ),
    );
  }
}

class MySliverTabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverTabBarHeaderDelegate(this._profileContainerWidgetStateController);

  final TabController _profileContainerWidgetStateController;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _profileContainerWidgetStateController,
        indicatorColor: Colors.black,
        isScrollable: false,
        indicatorWeight: 0,
        indicatorSize: TabBarIndicatorSize.label,
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
        onTap: (index) {
          print('object---${index}');
          // 切换tab
        },
        physics: const BouncingScrollPhysics(),
        tabs: listTabs,
      ),
    );
  }

  @override
  double get maxExtent => 46.0;

  @override
  double get minExtent => 46.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
