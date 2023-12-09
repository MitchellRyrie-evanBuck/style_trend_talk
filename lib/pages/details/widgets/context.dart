import 'package:flutter/material.dart';

class ContextWidget extends StatefulWidget {
  const ContextWidget({super.key});

  @override
  State<ContextWidget> createState() => _ContextWidgetState();
}

class _ContextWidgetState extends State<ContextWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 330,
        color: Colors.grey[200],
      ),
    );
  }
}
