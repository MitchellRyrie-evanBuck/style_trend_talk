import 'package:flutter/material.dart';
import 'package:style_trend_talk/pages/core/search/widget/header.dart';

class SeniorSearch extends StatefulWidget {
  const SeniorSearch({super.key});

  @override
  State<SeniorSearch> createState() => _SearchState();
}

class _SearchState extends State<SeniorSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // const SearchAppHeader(),
            SliverPersistentHeader(
              pinned: true,
              delegate: MyCustomHeader(minHeight: 50, maxHeight: 50),
            ),
            // 其他 Sliver 组件
            SliverFillRemaining(
              child: Container(
                height: 300,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomHeader extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  MyCustomHeader({required this.minHeight, required this.maxHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // 返回头部的 Widget
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Custom Header',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // 判断是否需要重建头部，根据实际需求返回 true 或 false
    return true;
  }
}
