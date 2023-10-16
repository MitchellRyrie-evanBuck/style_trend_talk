import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
import 'package:style_trend_talk/widget/videoWidget.dart';
import 'package:video_player/video_player.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

List<String> items = List.generate(2, (index) => 'Item $index');

class _FollowPageState extends State<FollowPage> {
  final String assetVideoPath = 'assets/video/sea.mov';
  final String urlVideoPath =
      'https://vd2.bdstatic.com/mda-mjb96ixztfmrdrav/540p/h264_cae/1634020164375344403/mda-mjb96ixztfmrdrav.mp4?v_from_s=hkapp-haokan-hbe&auth_key=1697179717-0-0-c6ee76e2e418a7bc2098ae5a4c2d1063&bcevod_channel=searchbox_feed&pd=1&cr=0&cd=0&pt=3&logid=2917832372&vid=4617356067770145776&klogid=2917832372&abtest=112751_4';

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 10),
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemCount: items.length + 1, // Add 1 for load more indicator
      itemBuilder: (context, index) {
        if (index < items.length) {
          return Container(
            height: 260,
            child: VideoComponent(videoPath: assetVideoPath),
          );
        } else if (index == items.length) {
          // Load more indicator
          return const ProgressIndicatorWidget();
        }
        return null;
      },
    );
  }
}
