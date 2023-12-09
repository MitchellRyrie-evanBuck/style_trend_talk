import 'package:flutter/material.dart';

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
        itemBuilder: (BuildContext context, index) {
          return SizedBox(
            height: 50,
            child: Center(
              child: Text('$index'),
            ),
          );
        },
        itemCount: 20);
  }
}
