// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: avoid_print, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/widget/flickr.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../pages/index.dart';

class VideoComponent extends StatefulWidget {
  final String videoPath;
  final String id;

  const VideoComponent({super.key, required this.videoPath, required this.id});

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
  double iconSize = 30;
  double distance = 7;
  late bool isPlaying = false;
  late Duration duration;
  late Duration position;
  late bool showControls;
  final Duration milliseconds300 = const Duration(milliseconds: 300);
  final Duration seconds2 = const Duration(seconds: 2);
  late Timer delayedTimer = Timer(milliseconds300, () {});
  late String videoTimer;
  late Timer _timer;
  Duration _currentTime = Duration.zero;
  final homeController = Get.put(HomeController());

  /// 每次执行完 暂停 播放时 都会置为false
  bool operation = true; // 检测你在 两秒内 有没有动作
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool isVisibility = true;

  @override
  void initState() {
    super.initState();
    isShow = false;
    isPlaying = false;
    showControls = true;
    homeController.setVideoId(widget.id); // 设置初始ID
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
      duration: milliseconds300,
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
      6.滑动到当前视区时 自动开始根据设置的 声音 开始静音/有音 播放
      7. 播放完开始循环播放
    */
    _controller.addListener(() {
      // print('_controller---->${_controller.value}');
      // print('duration---->${_controller.value.duration}');
      // print('position---->${_controller.value.position}');
      // print('buffered---->${_controller.value.buffered}');
      // print('isPlaying---->${_controller.value.isPlaying}');
      // print('isLooping---->${_controller.value.isLooping}');
      // print('isBuffering---->${_controller.value.isBuffering}');
      // print('volume---->${_controller.value.volume}');
      // print('playbackSpeed---->${_controller.value.playbackSpeed}');
      if (mounted) {
        setState(() {
          isPlaying = _controller.value.isPlaying;
          duration = _controller.value.duration;
          position = _controller.value.position;
          _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
        });
      }
      if (homeController.volume.value) {
        _controller.setVolume(1);
      } else {
        _controller.setVolume(0);
      }
    });

    _controller.addListener(() {
      // 播放完成之后 索引回初
      if (!_controller.value.isPlaying &&
          _controller.value.position == duration) {
        _controller.seekTo(Duration.zero); // Reset to the beginning
        _controller.pause();
        setState(() {
          showControls = true;
          isVisibility = true;
          _animationController.reverse();
          _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
          _currentTime = _controller.value.position;
        });
      }
    });
  }

  void _updateTimer(Timer timer) {
    if (_controller.value.isPlaying && mounted) {
      setState(() {
        _currentTime = _controller.value.position;
      });
    }
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    String formattedDuration = '';

    if (hours > 0) {
      formattedDuration += '${hours.toString()}:';
    }

    formattedDuration +=
        '${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedDuration;
  }

  void _setVolume() {
    if (homeController.volume.value) {
      _controller.setVolume(0);
      homeController.setVolume(false);
    } else {
      _controller.setVolume(1);
      homeController.setVolume(true);
    }
  }

  void _displayContoller() {
    if (mounted) {
      setState(() {
        showControls = false;
        _animationController.forward();
        Future.delayed(milliseconds300, () {
          isVisibility = false;
          operation = true;
        });
      });
    }
  }

  void _showPlayController() {
    setState(() {
      showControls = true;
      _animationController.reverse();
      isVisibility = true;
      // TODO
      //展开蒙层之后没有下一步动作 还是会继续隐藏蒙层
      delayedTimer = Timer(seconds2, () {
        if (operation) {
          // true 没有进行操作
          // 隐藏控制栏
          _displayContoller();
        }
      });
    });
  }

  /// 点击开始播放之后 自动 [_displayContoller] 隐藏控制窗
  void iconCallback() {
    setState(() {
      // print('出发play事件showControls---${showControls}');
      // print('出发play事件operation---${operation}');

      // if (!showControls) {
      //   _animationController.reverse();
      //   setState(() {
      //     showControls = true;
      //   });
      //   return;
      // }

      if (isPlaying) {
        _controller.pause();
        delayedTimer.cancel();
        _displayContoller();
        // delayedTimer = Timer(seconds2, () {
        //   if (operation) {
        //   }
        // });
      } else {
        delayedTimer.cancel();
        _controller.play();
        _displayContoller();
      }
      operation = false;
    });
  }

  /// 最外层GestureDetector 点击生效
  /// 点击显示蒙层 唯一入口
  _viewsContainerCallback() {
    setState(() {
      // print('最外层GestureDetector--${showControls}');
      if (!showControls) {
        _showPlayController();
      }

      if (showControls) {
        _animationController.reverse(); // 隐藏控制器
        if (_controller.value.isPlaying) {
          _controller.pause(); // 如果当前在播放，点击控制器时暂停视频
        }
      } else {
        _animationController.forward(); // 展示控制器
      }
    });
  }

  onVisibilityChanged(visibilityInfo) {
    // Handle visibility changes if needed
    var visiblePercentage = visibilityInfo.visibleFraction * 100;
    debugPrint(
        'Widget ${homeController.currentPlayingVideoId} ----=====---- ${widget.id} is ==========================');
    if (visiblePercentage == 100) {
      if (homeController.currentPlayingVideoId.value != widget.id) {
        // 设置视频ID为当前播放ID
        homeController.setVideoId(widget.id);
      } else {}

      // ignore: unrelated_type_equality_checks
      if (homeController.currentPlayingVideoId.value == widget.id) {
        // _controller.play();
        _displayContoller();
      } else {
        if (mounted) {
          _controller.pause();
          _displayContoller();
        }
      }
    } else {
      if (mounted) {
        _controller.pause();
        _displayContoller();
      }
    }

    // ignore: unnecessary_brace_in_string_interps
    // debugPrint('Widget ${widget.videoPath} is ${visiblePercentage}% visible');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build
    return _visibilityDetector(context);
  }

  VisibilityDetector _visibilityDetector(BuildContext context) {
    return VisibilityDetector(
        key: ObjectKey(widget.id), // Use ObjectKey with a unique identifier
        onVisibilityChanged: onVisibilityChanged,
        child: isShow
            ? GestureDetector(
                onTap: () {
                  _viewsContainerCallback();
                },
                behavior: HitTestBehavior.deferToChild,
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
                        videoControls(),
                        Positioned(
                            right: distance,
                            bottom: distance,
                            child: Obx(
                              () => IconButton(
                                onPressed: () {
                                  _setVolume();
                                },
                                icon: Icon(
                                  !homeController.volume.value
                                      ? FontAwesomeIcons.volumeXmark
                                      : FontAwesomeIcons.volumeHigh,
                                  color: FitnessAppTheme.white,
                                  size: 12,
                                ),
                              ),
                            )),
                        Positioned(
                            right: distance,
                            top: distance,
                            child: Container(
                              height: 24,
                              width: 54,
                              alignment: Alignment.center,
                              child: Text(
                                _formatDuration(
                                    _controller.value.duration - _currentTime),
                                style: const TextStyle(
                                    color: FitnessAppTheme.white, fontSize: 14),
                              ),
                            ))
                      ],
                    )))
            : SizedBox(
                height: _videoHeight,
                child: const Center(
                  child: ProcesssFlicker(),
                ),
              ));
  }

  Positioned videoControls() {
    return Positioned.fill(
        child: Stack(
      children: [
        Positioned.fill(
            child: FadeTransition(
          opacity: _animation,
          child: AnimatedContainer(
              duration: milliseconds300,
              color: const Color.fromARGB(69, 0, 0, 0)),
        )),
        Positioned.fill(
          child: FadeTransition(
            opacity: _animation,
            child: AnimatedContainer(
              duration: milliseconds300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isVisibility,
                    child: AnimatedSwitcher(
                        duration: milliseconds300,
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: AbsorbPointer(
                          absorbing: false,
                          child: IconButton(
                            key: ValueKey<bool>(isPlaying),
                            onPressed: () {
                              iconCallback();
                            },
                            icon: Icon(
                              isPlaying
                                  ? FontAwesomeIcons.pause
                                  : FontAwesomeIcons.play,
                              size: iconSize,
                              color: FitnessAppTheme.white,
                            ),
                          ),
                        )),
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

  @override
  void dispose() {
    delayedTimer.cancel();
    _controller.dispose();
    _timer.cancel();
    VisibilityDetectorController.instance.forget(Key(widget.id));
    _animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true; // 启用状态保持
}
