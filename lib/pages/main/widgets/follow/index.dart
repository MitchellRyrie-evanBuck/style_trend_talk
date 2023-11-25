import 'package:flutter/material.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
import 'package:style_trend_talk/widget/videoWidget.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

List<String> items = List.generate(2, (index) => 'Item $index');

class _FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Container(
            height: 50,
            child: Center(
              child: Text('${index}'),
            ),
          );
        },
        itemCount: 20);
  }
}
