import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/pages/core/publish/widget/header.dart';
import 'package:style_trend_talk/widget/flickr.dart';

class PublishWidgetPage extends StatefulWidget {
  const PublishWidgetPage({super.key});

  @override
  State<PublishWidgetPage> createState() => _PublishWidgetPageState();
}

class _PublishWidgetPageState extends State<PublishWidgetPage> {
  Future<bool> getData() async {
    // await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  TextEditingController _controller = TextEditingController();
  int _maxLines = 12; // 设置最大行数
  int _maxTextSize = 100;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: FitnessAppTheme.white,
        body: SafeArea(
          child: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const ProcesssFlicker();
                } else {
                  return CustomScrollView(
                    slivers: [
                      const PublishAppHeader(),
                      // 其他 Sliver 组件
                      SliverFillRemaining(
                          child: SizedBox(
                        width: screenWidth,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                _inputBlur(),
                                Container(
                                  color:
                                      const Color.fromARGB(255, 248, 248, 248),
                                  height: 210,
                                )
                              ],
                            ),
                            _pushBtn()
                          ],
                        ),
                      )),
                    ],
                  );
                }
              }),
        ));

    // ...
  }

  Widget _inputBlur() {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
      color: const Color.fromARGB(255, 248, 248, 248),
      child: TextField(
        controller: _controller,
        maxLines: _maxLines,
        style: const TextStyle(color: FitnessAppTheme.black),
        decoration: InputDecoration(
          border: InputBorder.none, // 去掉边框
          hintText: '请输入',
          helperText: 'Please enter your full life',
          helperStyle: const TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
          counter: Text('${_controller.text.length}/$_maxTextSize'),
          fillColor: Color.fromARGB(255, 62, 62, 62),
          counterText:
              '${_controller.text.length}/$_maxTextSize', // 显示当前输入数和最大输入数
          counterStyle: TextStyle(
            color: _controller.text.length > _maxTextSize
                ? Colors.red
                : Theme.of(context).textTheme.caption!.color,
          ),
          contentPadding:
              const EdgeInsets.only(bottom: 20, left: 10, top: 10, right: 10),
        ),
        onChanged: (text) {
          setState(() {});
        },
      ),
    );
  }

  Positioned _pushBtn() {
    return Positioned(
      bottom: 10,
      left: 20,
      right: 20,
      child: ElevatedButton(
        onPressed: () {
          // 处理按钮点击事件
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(48),
          backgroundColor: FitnessAppTheme.black,
          elevation: 8, // 阴影高度
          shadowColor: FitnessAppTheme.btnBlack,
          animationDuration: const Duration(milliseconds: 300),
          enableFeedback: true,
        ),
        child: const Text(
          "发布",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: FitnessAppTheme.white),
        ),
      ),
    );
  }
}
