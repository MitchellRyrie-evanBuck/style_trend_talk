import 'package:flutter/material.dart';
import 'package:style_trend_talk/data/index.dart';

class CustomMessageWidget extends StatefulWidget {
  const CustomMessageWidget({super.key, required this.itemData});
  final NotifierTionListModel itemData;
  @override
  State<CustomMessageWidget> createState() => _CustomMessageWidgetState();
}

class _CustomMessageWidgetState extends State<CustomMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.amberAccent,
    );
  }
}
