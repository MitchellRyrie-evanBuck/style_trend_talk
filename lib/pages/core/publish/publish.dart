import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/pages/core/publish/widget/header.dart';
import 'package:style_trend_talk/widget/flickr.dart';

class PublishWidgetPage extends StatefulWidget {
  const PublishWidgetPage({super.key});

  @override
  State<PublishWidgetPage> createState() => _PublishWidgetPageState();
}

class _PublishWidgetPageState extends State<PublishWidgetPage> {
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const ProcesssFlicker();
            } else {
              return Stack(
                children: <Widget>[
                  CustomScrollView(
                    slivers: [
                      // const PublishAppHeader(),
                      SliverAppBar(
                        expandedHeight: 50.0,
                        floating: false,
                        pinned: true,
                        leading: IconButton(
                          icon: const Icon(FontAwesomeIcons.xmark),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        backgroundColor: Colors.grey,
                        flexibleSpace: const FlexibleSpaceBar(
                          title: Text(
                            'Custom AppBar',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      // 其他 Sliver 组件
                      SliverFillRemaining(
                        child: Container(),
                      ),
                    ],
                  )
                ],
              );
            }
          }),
    );

    // ...
  }
}
