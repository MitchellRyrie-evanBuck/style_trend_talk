import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/pages/profile/widgets/profileHeader.dart';

import '../index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return ProfileContainerWidget();
  }

  Stack _ProfileContextHeader() {
    return Stack(
      children: [
        // 背景
        Container(
          height: 180,
          width: MediaQuery.of(Get.context!).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/profile/profile.png'),
                fit: BoxFit.cover),
          ),
        ),
        // 内容
        Container(
          margin: const EdgeInsets.only(top: 156, left: 25),
          child: Column(
            children: [
              // 头像
              Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/profile/user.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
  TabController? _profileContainerWidgetStateController;

  late List<Tab> listTabs = [
    const Tab(text: '时光机'),
    const Tab(text: '视频'),
    const Tab(text: '图片'),
    const Tab(text: '点赞'),
    const Tab(text: '收藏'),
  ];

  final List<Widget> listWidgets = [
    Container(
      color: Colors.white,
      child: const Center(child: Text('时光机')),
    ),
    Container(
      color: Colors.white,
      child: const Center(child: Text('视频')),
    ),
    Container(
      color: Colors.white,
      child: const Center(child: Text('图片')),
    ),
    Container(
      color: Colors.white,
      child: const Center(child: Text('点赞')),
    ),
    Container(
      color: Colors.white,
      child: const Center(child: Text('收藏')),
    ),
  ];

  final List<Map<String, dynamic>> listProfile = [
    {
      'name': '数据资产',
      'icon': FontAwesomeIcons.asterisk,
      'title': '管理我的数据资产',
      'route': '/profile/info',
      'desc': ''
    },
    {
      'name': '基础信息',
      'icon': FontAwesomeIcons.user,
      'title': '填写信息',
      'route': '/profile/info',
      'desc': ''
    },
    {
      'name': '清单',
      'icon': FontAwesomeIcons.sun,
      'title': '---',
      'route': '/profile/info',
      'desc': ''
    },
    {
      'name': '我的相关',
      'icon': FontAwesomeIcons.hand,
      'title': '访客记录  私藏',
      'route': '/profile/info',
      'desc': ''
    },
  ];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerFn);
    _profileContainerWidgetStateController =
        TabController(length: listTabs.length, vsync: this);
    _profileContainerWidgetStateController!
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
        'profileContainerWidgetStateControllerFn----${_profileContainerWidgetStateController!.index}');
  }

  @override
  Widget build(BuildContext context) {
    // return NestedScrollView(
    //   controller: scrollController,
    //   floatHeaderSlivers: true,
    //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //     return <Widget>[
    //       SliverAppBar(
    //         expandedHeight: 180.0,
    //         floating: false,
    //         pinned: true,
    //         actions: [
    //           IconButton(
    //             icon: const Icon(
    //               FontAwesomeIcons.cog,
    //               color: Colors.white,
    //             ),
    //             onPressed: () {},
    //           ),
    //         ],
    //         title: Container(
    //           height: 30,
    //           width: 30,
    //           decoration: const BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage('assets/images/profile/user.png'),
    //                 fit: BoxFit.cover),
    //           ),
    //         ),
    //         surfaceTintColor: Colors.black,
    //         backgroundColor: const Color.fromARGB(255, 40, 40, 40),
    //         foregroundColor: Colors.white,
    //         flexibleSpace: FlexibleSpaceBar(
    //           background: Image.asset(
    //             'assets/images/profile/profile.png',
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //     ];
    //   },
    //   body:
    return DefaultTabController(
        length: listTabs.length,
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            MyProfileHeader(),
            _MyProfileDesc(listProfile),
            _MyProfileLife(),
            _MyProfileContext()
          ],
        ));
    // );
  }

  SliverFillRemaining _MyProfileContext() {
    return SliverFillRemaining(
      child: TabBarView(
        controller: _profileContainerWidgetStateController,
        children: listWidgets,
      ),
    );
  }

  SliverToBoxAdapter _MyProfileLife() {
    return SliverToBoxAdapter(
        child: Container(
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
    ));
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
