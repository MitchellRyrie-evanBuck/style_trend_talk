// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/widget/flickr.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  final String videoPath;

  const VideoComponent({super.key, required this.videoPath});

  @override
  // ignore: library_private_types_in_public_api
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late Widget playerWidget;
  bool isShow = false;
  double _videoHeight = 220.0; // 初始高度，可以根据需要调整
  final double _maxVideoHeight = 400.0; // 最大高度，可以根据需要调整
  double _videoWidth = 300;
  double iconSize = 50;
  late bool isPlaying = false;
  late Duration duration;
  late Duration position;
  late bool showControls;
  final Duration animatedPlayFlag = const Duration(milliseconds: 500);
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool isVisibility = true;

  @override
  void initState() {
    super.initState();
    isShow = false;
    isPlaying = false;
    showControls = true;
    _initializeChewieController();
    _initPlayController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _initializeChewieController();
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    String formattedDuration = hours > 0
        ? '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'
        : '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedDuration;
  }

  _initPlayController() {
    _animationController = AnimationController(
      duration: animatedPlayFlag,
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // _animationController.forward();
  }

  _initializeChewieController() {
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        double videoWidth = _controller.value.size.width;
        double videoHeight = _controller.value.size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        double calculatedHeight = screenWidth * (videoHeight / videoWidth);
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

    /*
      添加视频控制器监听
      1.默认显示 播放控制器
      2.点击 视频 暂停 之后 蒙板
      3.蒙板显示开始播放按钮 并于一秒后 慢慢消失
      4.暂停与播放 有一个变换的动画
      5.播放完成之后 显示蒙版 和 开始播放按钮
    */
    _controller.addListener(() {
      // 在此可以处理视频播放状态的变化
      // print('_controller---->${_controller.value}');
      // print('duration---->${_controller.value.duration}');
      // print('position---->${_controller.value.position}');
      // print('buffered---->${_controller.value.buffered}');
      // print('isPlaying---->${_controller.value.isPlaying}');
      // print('isLooping---->${_controller.value.isLooping}');
      // print('isBuffering---->${_controller.value.isBuffering}');
      // print('volume---->${_controller.value.volume}');
      // print('playbackSpeed---->${_controller.value.playbackSpeed}');

      setState(() {
        isPlaying = _controller.value.isPlaying;
        duration = _controller.value.duration;
        position = _controller.value.position;
      });
    });

    _controller.addListener(() {
      // 监听点击完开始之后 慢慢消失icon按钮
      if (_controller.value.isPlaying) {
        // setState(() {
        //   showControls = false;
        //   _animationController.forward();
        //   Future.delayed(animatedPlayFlag, () {
        //     isVisibility = false;
        //   });
        // });
      }
      // if (!_controller.value.isPlaying) {
      //   setState(() {
      //     showControls = true;
      //     _animationController.reverse();
      //   });
      // }

      // 播放完成之后 索引回初
      if (!_controller.value.isPlaying &&
          _controller.value.position == duration) {
        _controller.seekTo(Duration.zero); // Reset to the beginning
        _controller.pause();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animationController.dispose();
    // chewieController.dispose();
  }

  @override
  bool get wantKeepAlive => true; // 启用状态保持

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build
    return isShow
        ? GestureDetector(
            onTap: () {
              setState(() {
                print('最外层GestureDetector--${showControls}');
                // showControls = true;
                if (!showControls) {
                  setState(() {
                    showControls = true;
                    isVisibility = true;
                  });
                  _animationController.reverse();
                  return;
                }
              });
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
                height: _videoHeight,
                width: MediaQuery.of(context).size.width,
                color: FitnessAppTheme.black,
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: _videoHeight,
                        width: _videoWidth,
                        child: videoViews(),
                      ),
                    ),
                    videoControls()
                  ],
                )))
        : SizedBox(
            height: _videoHeight,
            child: const Center(
              child: ProcesssFlicker(),
            ),
          );
  }

  Positioned videoControls() {
    return Positioned.fill(
        child: Stack(
      children: [
        Positioned.fill(
            child: FadeTransition(
          opacity: _animation,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: Color.fromARGB(69, 0, 0, 0)),
        )),
        Positioned.fill(
          child: FadeTransition(
            opacity: _animation,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isVisibility,
                    child: AnimatedSwitcher(
                      duration: animatedPlayFlag,
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: IconButton(
                        key: ValueKey<bool>(isPlaying),
                        onPressed: () {
                          setState(() {
                            print('出发play事件${showControls}');
                            if (!showControls) {
                              _animationController.reverse();
                              setState(() {
                                showControls = true;
                              });
                              return;
                            }
                            if (isPlaying) {
                              _controller.pause();
                            } else {
                              setState(() {
                                showControls = false;
                                _animationController.forward();
                                Future.delayed(animatedPlayFlag, () {
                                  isVisibility = false;
                                });
                              });
                              _controller.play();
                            }
                          });
                        },
                        icon: Icon(
                          isPlaying
                              ? FontAwesomeIcons.pause
                              : FontAwesomeIcons.play,
                          size: iconSize,
                          color: FitnessAppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget videoViews() {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(
            child: ProcesssFlicker(),
          );
  }
}
