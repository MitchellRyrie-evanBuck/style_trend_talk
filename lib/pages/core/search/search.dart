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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // const SearchAppHeader(),
          // 其他 Sliver 组件
          SliverFillRemaining(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
