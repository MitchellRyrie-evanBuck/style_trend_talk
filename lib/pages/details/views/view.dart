import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/pages/details/widgets/header.dart';

import '../index.dart';

class DetailsPage extends GetView<DetailsController> {
  DetailsPage({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();

  // 主视图
  Widget _buildView(BuildContext context) {
    // 获取传递过来的数据
    var data = Get.arguments;
    if (data != null) {
      debugPrint('=========${data.id}');
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: CustomScrollView(
              slivers: <Widget>[
                DetailsHeader(
                  data: data,
                ),
                if (data.photo != null)
                  ContextWidget(
                    data: data,
                  ),
                const ContentWidget(),
                const CommentWidget(),
                const SliverFillRemaining(
                  child: SizedBox(),
                )
              ],
            ),
          ),
          CommentAlign(controller: _controller),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      id: "details",
      builder: (_) {
        return Scaffold(
          backgroundColor: FitnessAppTheme.white,
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }
}

class CommentAlign extends StatelessWidget {
  const CommentAlign({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 50,
          color: FitnessAppTheme.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 244, 244), // 设置背景色
                  borderRadius: BorderRadius.circular(20.0), // 设置圆角（可选）
                ),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '说点什么...',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    contentPadding:
                        const EdgeInsets.only(top: 2, left: 0, right: 0),
                    prefixIconConstraints:
                        const BoxConstraints.tightFor(width: 40),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.penToSquare,
                        color: Color.fromARGB(255, 143, 143, 143),
                        size: 14,
                      ),
                      onPressed: () {
                        print('Searching for: ${_controller.text}');
                      },
                    ),
                  ),
                  onSubmitted: (text) {
                    // Handle search action here as well
                    print('Searching for: $text');
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Container(
                height: 40,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.heart),
                    Icon(FontAwesomeIcons.star),
                    Icon(FontAwesomeIcons.comment)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
