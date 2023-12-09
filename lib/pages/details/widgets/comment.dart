import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: Colors.grey[100],
      ),
    );
  }
}
