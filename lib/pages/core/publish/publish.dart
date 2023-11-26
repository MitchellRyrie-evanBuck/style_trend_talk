import 'package:flutter/material.dart';

class PublishWidgetPage extends StatefulWidget {
  const PublishWidgetPage({super.key});

  @override
  State<PublishWidgetPage> createState() => _PublishWidgetPageState();
}

class _PublishWidgetPageState extends State<PublishWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 100.0,
          ),
          // 其他 Sliver 组件
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      )),
    );
    // ...
  }
}
