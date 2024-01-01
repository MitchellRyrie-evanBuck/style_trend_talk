import 'package:flutter/material.dart';

const String _name = "Pawan";

class ChatMessage extends StatelessWidget {
  final String text;
  const ChatMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    final queryScreenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: queryScreenWidth - 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(_name[0]),
            ),
          ),
          Expanded(
            // 使用Expanded包装文本所在的Container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_name, style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    text,
                    softWrap: true,
                    style: TextStyle(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
