import 'package:flutter/material.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

TextStyle _textStyle =
    const TextStyle(color: Color.fromARGB(255, 92, 148, 196), fontSize: 14);

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '关于写作这件事情',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text:
                      'Our lives are streams,\nflowing into the same river, \ntowards whatever heaven lies in the mist beyond the falls…Close your eyes, let the waters take you home.',
                  style: TextStyle(
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // 标签  地址 时间
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  '#人生笔记',
                  style: _textStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  '#追逐自由',
                  style: _textStyle,
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
