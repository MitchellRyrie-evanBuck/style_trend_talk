import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:style_trend_talk/widget/flickr.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  final String videoPath;

  const VideoComponent({super.key, required this.videoPath});

  @override
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  late VideoPlayerController _controller;
  // late ChewieController chewieController;
  late Widget playerWidget;
  bool isChewieControllerInitialized = false;
  bool isShow = false;
  double _videoHeight = 220.0; // 初始高度，可以根据需要调整
  double _maxVideoHeight = 500.0; // 最大高度，可以根据需要调整
  double _videoWidth = 300;

  @override
  void initState() {
    super.initState();
    _initializeChewieController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _initializeChewieController();
  }

  _initializeChewieController() {
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        double videoWidth = _controller.value.size.width;
        double videoHeight = _controller.value.size.height;
        // 获取屏幕宽度
        double screenWidth = MediaQuery.of(context).size.width;

        // 计算适当的高度，以确保视频宽度等于屏幕宽度，且高度等比例放大
        double calculatedHeight = screenWidth * (videoHeight / videoWidth);

        // 设置视频宽高比
        // _controller.setVolume(1.0); // 设置音量
        // _controller.play(); // 播放视频
        print('calculatedHeight----$calculatedHeight');

        setState(() {
          _videoHeight = calculatedHeight;
          _videoHeight = screenWidth;
          isShow = true;
        });
      });

    // 添加视频控制器监听
    _controller.addListener(() {
      // 在此可以处理视频播放状态的变化
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    // chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('videoHeight----$_videoHeight');
    return isShow
        ? Container(
            height: _videoHeight,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
            height: _videoHeight,
            child: const Center(
              child: ProcesssFlicker(),
            ),
          );
  }
}
