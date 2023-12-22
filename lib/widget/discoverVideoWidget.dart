// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: avoid_print, file_names

import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/widget/flickr.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../pages/index.dart';

class DiscoverVideoComponent extends StatefulWidget {
  final String videoPath;
  final String id;

  const DiscoverVideoComponent(
      {super.key, required this.videoPath, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _DiscoverVideoComponentState createState() => _DiscoverVideoComponentState();
}

class _DiscoverVideoComponentState extends State<DiscoverVideoComponent>
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
        _controller.setVolume(1);
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
      if (mounted) {
        setState(() {
          isPlaying = _controller.value.isPlaying;
          duration = _controller.value.duration;
          position = _controller.value.position;
          _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
        });
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

  _viewsContainerCallback() {
    setState(() {
      if (isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build
    return _visibilityDetector(context);
  }

  Widget _visibilityDetector(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _viewsContainerCallback();
        },
        behavior: HitTestBehavior.deferToChild,
        child: Container(
            // height: _videoHeight,
            width: MediaQuery.of(context).size.width,
            color: FitnessAppTheme.black,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    // height: _videoHeight,
                    // width: _videoWidth,
                    child: videoViews(),
                  ),
                ),
              ],
            )));
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
