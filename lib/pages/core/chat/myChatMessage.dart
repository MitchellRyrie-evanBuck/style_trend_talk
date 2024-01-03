import 'package:flutter/material.dart';
import 'package:style_trend_talk/data/models/mock/chat.dart';

class MyChatMessage extends StatelessWidget {
  final ChartModel data;
  const MyChatMessage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final queryScreenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
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
