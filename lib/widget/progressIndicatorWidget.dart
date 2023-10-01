import 'dart:async';

import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  State<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  Timer? timer;
  String loadingText = '加载中.';
  @override
  void initState() {
    super.initState();
    startLoadingAnimation();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        // 监听动画执行完之后 反向执行动画
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (_controller.status == AnimationStatus.dismissed) {
          // 监听动画反向执行完之后 再次正向执行动画
          _controller.forward();
        }
      });

    _colorAnimation = ColorTween(
      begin: Color.fromARGB(255, 187, 187, 187),
      end: Colors.black,
    ).animate(_controller);

    // 启动动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  void startLoadingAnimation() {
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (loadingText == '加载中.') {
          loadingText = '加载中..';
        } else if (loadingText == '加载中..') {
          loadingText = '加载中...';
        } else {
          loadingText = '加载中.';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                        semanticsLabel: loadingText,
                        color: Colors.black,
                        valueColor: _colorAnimation,
                        strokeAlign: 0.1,
                        strokeCap: StrokeCap.round,
                        backgroundColor: Colors.transparent));
              }),
        ),
        const SizedBox(height: 5),
        AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Text(
                loadingText,
                style: TextStyle(fontSize: 10, color: _colorAnimation.value),
              );
            }),
      ],
    );
  }
}
