import 'package:flutter/material.dart';
import 'package:style_trend_talk/data/models/mock/recommendation.dart';
import 'package:style_trend_talk/pages/main/widgets/recommendation/index.dart';

class ContextWidget extends StatefulWidget {
  const ContextWidget({super.key, required this.data});
  final RecommendationModel data;
  @override
  State<ContextWidget> createState() => _ContextWidgetState();
}

class _ContextWidgetState extends State<ContextWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ImgLookContainer(
        imgHeight: 300,
        itemData: widget.data,
      ),
    );
  }
}
