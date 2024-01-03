import 'package:flutter/material.dart';
import 'package:style_trend_talk/data/models/mock/chat.dart';

const String _name = "Pawan";

class ChatMessage extends StatelessWidget {
  final ChartModel data;
  const ChatMessage(this.data);

  @override
  Widget build(BuildContext context) {
    final queryScreenWidth = MediaQuery.of(context).size.width;
    print('queryScreenWidth===@@@@@@@@@@@@@@@@@@@@@@@@@@@@$queryScreenWidth');
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile/user.png'))),
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: queryScreenWidth - 100,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 12, right: 12, bottom: 8),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 111, 77, 246),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      data.text,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
