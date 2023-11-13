import 'package:flutter/material.dart';

class RefreshGIFWidget extends StatefulWidget {
  const RefreshGIFWidget({super.key});

  @override
  State<RefreshGIFWidget> createState() => _RefreshGIFWidgetState();
}

class _RefreshGIFWidgetState extends State<RefreshGIFWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.amberAccent,
      height: 100,
      child: Image.asset('assets/gif/refresh.gif'),
    );
  }
}
