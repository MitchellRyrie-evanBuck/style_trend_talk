import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:style_trend_talk/widget/flickr.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  final String videoPath;

  const VideoComponent({super.key, required this.videoPath});

  @override
  // ignore: library_private_types_in_public_api
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  late Widget playerWidget;
  bool isChewieControllerInitialized = false;

  double videoHeight = 220.0; // 初始高度，可以根据需要调整
  double maxVideoHeight = 500.0; // 最大高度，可以根据需要调整

  @override
  void initState() {
    super.initState();
    // _initializeChewieController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeChewieController();
  }

  _initializeChewieController() {
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown and set state to rebuild the widget.
        setState(() {
          chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: false,
            looping: true,
            showControls: true,
            aspectRatio: 16 / 9, // 视频宽高比
            // overlay: Container(
            //   height: 50,
            //   width: 50,
            //   color: Colors.green,
            // ),
            allowFullScreen: false,
            allowMuting: false,
            allowPlaybackSpeedChanging: false,
            controlsSafeAreaMinimum: const EdgeInsets.only(bottom: 8),
            // customControls: Column(
            //   children: [
            //     // 添加自定义的全屏按钮
            //     IconButton(
            //       onPressed: () {
            //         chewieController.enterFullScreen();
            //       },
            //       icon: Icon(Icons.fullscreen),
            //     ),
            //     // 在此添加其他自定义控制按钮
            //   ],
            // ),
          );

          playerWidget = Chewie(
            controller: chewieController,
          );

          // 获取视频的宽高信息
          double videoWidth = _controller.value.size.width;
          double videoHeight = _controller.value.size.height;

          // 获取父级容器的宽度
          double parentWidth =
              MediaQuery.of(context).size.width; // 可以根据需要修改获取父级容器宽度的方式

          // 计算适当的高度，以确保视频宽度撑满父级，但不超过最大高度
          double calculatedHeight = parentWidth * (videoHeight / videoWidth);
          this.videoHeight = calculatedHeight.clamp(0.0, maxVideoHeight);

          // 如果视频高度小于最大高度，垂直居中
          if (calculatedHeight < maxVideoHeight) {
            this.videoHeight = calculatedHeight;
          } else {
            this.videoHeight = maxVideoHeight;
          }
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      // ignore: unnecessary_null_comparison
      if (chewieController != null) {
        return SizedBox(
          height: videoHeight, // 动态设置父级容器的高度
          child: Center(child: playerWidget),
        );
      } else {
        return const Center(
          child: ProcesssFlicker(), // 或者其他加载中的指示器
        );
      }
    } else {
      return const Center(
        child: ProcesssFlicker(),
      );
    }
  }
}
