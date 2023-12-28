import 'package:flutter/material.dart';

class DiscoverComment extends StatefulWidget {
  const DiscoverComment({super.key});

  @override
  State<DiscoverComment> createState() => _DiscoverCommentState();
}

class _DiscoverCommentState extends State<DiscoverComment> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4, // 初始高度占整个屏幕的比例
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.blueGrey,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        );
      },
    );
  }
}
