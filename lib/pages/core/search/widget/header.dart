import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
// import 'package:style_trend_talk/pages/core/publish/controllers/publishControllers.dart';

class SearchAppHeader extends StatefulWidget {
  const SearchAppHeader({
    super.key,
  });
  @override
  State<SearchAppHeader> createState() => _SearchAppHeaderState();
}

class _SearchAppHeaderState extends State<SearchAppHeader>
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
  TextEditingController _controller = TextEditingController();

  final double tabHeight = 48;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double tabWidth = MediaQuery.of(context).size.width - 60;

    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 40,
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                  onPressed: () {
                    navigator?.pop(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    size: 20,
                  )),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: tabWidth,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color.fromARGB(
                          255, 236, 236, 236), // Grey background color
                    ),
                    child: Center(
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '请输入您的搜索关键词',
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 0),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.search,
                              size: 18,
                            ),
                            onPressed: () {
                              print('Searching for: ${_controller.text}');
                            },
                          ),
                        ),
                        onSubmitted: (text) {
                          // Handle search action here as well
                          print('Searching for: $text');
                        },
                      ),
                    ))
              ],
            ))
          ],
        ));
  }

  @override
  double get maxExtent => tabHeight;

  @override
  double get minExtent => tabHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
