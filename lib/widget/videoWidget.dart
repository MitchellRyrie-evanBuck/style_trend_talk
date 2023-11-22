import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/widget/flickr.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  final String videoPath;

  const VideoComponent({super.key, required this.videoPath});

  @override
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;
  // late ChewieController chewieController;
  late Widget playerWidget;
  bool isChewieControllerInitialized = false;
  bool isShow = false;
  double _videoHeight = 220.0; // 初始高度，可以根据需要调整
  final double _maxVideoHeight = 400.0; // 最大高度，可以根据需要调整
  double _videoWidth = 300;
  double iconSize = 50;
  late bool isPlaying = false;

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
        print('video---------width: + ${videoWidth} height: ${videoHeight}');
        // 获取屏幕宽度
        double screenWidth = MediaQuery.of(context).size.width;
        print('获取屏幕宽度------$screenWidth');

        // 计算适当的高度，以确保视频宽度等于屏幕宽度，且高度等比例放大
        double calculatedHeight = screenWidth * (videoHeight / videoWidth);

        // 设置视频宽高比
        // _controller.setVolume(1.0); // 设置音量
        // _controller.play(); // 播放视频
        print('calculatedHeight----$calculatedHeight');

        if (calculatedHeight > _maxVideoHeight) {
          double calculatedWidth = _maxVideoHeight * (videoWidth / videoHeight);

          setState(() {
            _videoHeight = _maxVideoHeight;
            _videoWidth = calculatedWidth;
            isShow = true;
          });
        } else {
          setState(() {
            _videoHeight = calculatedHeight;
            _videoWidth = screenWidth;
            isShow = true;
          });
        }
      });

    // 添加视频控制器监听
    _controller.addListener(() {
      // 在此可以处理视频播放状态的变化
      print('_controller---->${_controller.value}');
      print('duration---->${_controller.value.duration}');
      print('size---->${_controller.value.size}');
      print('position---->${_controller.value.position}');
      print('caption---->${_controller.value.caption}');
      print('captionOffset---->${_controller.value.captionOffset}');
      print('buffered---->${_controller.value.buffered}');
      print('isInitialized---->${_controller.value.isInitialized}');
      print('isPlaying---->${_controller.value.isPlaying}');
      print('isLooping---->${_controller.value.isLooping}');
      print('isBuffering---->${_controller.value.isBuffering}');
      print('volume---->${_controller.value.volume}');
      print('playbackSpeed---->${_controller.value.playbackSpeed}');

      setState(() {
        isPlaying = _controller.value.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    // chewieController.dispose();
  }

  @override
  bool get wantKeepAlive => true; // 启用状态保持

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build
    print('**************************************----$_videoHeight');
    return isShow
        ? Container(
            height: _videoHeight,
            width: MediaQuery.of(context).size.width,
            color: FitnessAppTheme.black,
            child: Center(
              child: SizedBox(
                height: _videoHeight,
                width: _videoWidth,
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
                      top: (_videoHeight - iconSize) / 2,
                      left: (_videoWidth - iconSize) / 2,
                      child: GestureDetector(
                        onTap: () {
                          isPlaying ? _controller.pause() : _controller.play();
                        },
                        child: Opacity(
                          opacity: 0.79,
                          child: Icon(
                            isPlaying
                                ? FontAwesomeIcons.pause
                                : FontAwesomeIcons.play,
                            size: iconSize,
                            color: FitnessAppTheme.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
        : SizedBox(
            height: _videoHeight,
            child: const Center(
              child: ProcesssFlicker(),
            ),
          );
  }
}
