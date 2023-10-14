import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  final String videoPath;

  const VideoComponent({Key? key, required this.videoPath});

  @override
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  late Widget playerWidget;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown and set state to rebuild the widget.
        setState(() {
          chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: true,
            looping: true,
            showControls: true,
            aspectRatio: 16 / 9, // 视频宽高比
          );

          playerWidget = Chewie(
            controller: chewieController,
          );
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
      return playerWidget;
    } else {
      return const Center(
        child: ProgressIndicatorWidget(),
      );
    }
  }
}
