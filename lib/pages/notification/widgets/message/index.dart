import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/index.dart';
import 'package:style_trend_talk/pages/index.dart';

class CustomMessageWidget extends StatefulWidget {
  const CustomMessageWidget({super.key, required this.itemData});
  final NotifierTionListModel itemData;
  @override
  State<CustomMessageWidget> createState() => _CustomMessageWidgetState();
}

class _CustomMessageWidgetState extends State<CustomMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return SwipeToDeleteChatBubble(
      data: widget.itemData,
    );
  }
}

class SwipeToDeleteChatBubble extends StatelessWidget {
  const SwipeToDeleteChatBubble({super.key, required this.data});
  final NotifierTionListModel data;

  Future<bool?> confirmDismissFn(val) async {
    print('confirmDismissFn----------$val');
    return false;
  }

  void onResizeFn() {
    print('onResizeFn----------');
  }

  void onUpdateFn(val) {
    print('onUpdateFn----------$val');
  }

  void onDismissedFn(direction) {
    print('onDismissedFn----------$direction');
    if (direction == DismissDirection.endToStart) {
      // onDelete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(data.userId.toString()), // Unique key for each message
      background: Container(
        color: Colors.red, // Background color when swiping
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child:
            const Icon(FontAwesomeIcons.trash, size: 16, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: confirmDismissFn,
      onResize: onResizeFn,
      onUpdate: onUpdateFn,
      onDismissed: onDismissedFn,
      movementDuration: const Duration(milliseconds: 600),
      child: GestureDetector(
          onLongPress: () {
            // onLongPress()
          }, // Trigger onLongPress event
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(data.avatarUrl))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                          ))
                    ]),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ChatPages(),
                        transition: Transition.rightToLeftWithFade,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                data.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text(
                                    data.lastMessage,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 99, 99, 99),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
