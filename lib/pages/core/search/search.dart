import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:style_trend_talk/data/fitness_app_theme.dart';
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
            const SearchAppHeader(),
            SliverFillRemaining(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
