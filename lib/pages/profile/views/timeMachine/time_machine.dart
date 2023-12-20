import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimeMachine extends StatefulWidget {
  const TimeMachine({super.key});

  @override
  State<TimeMachine> createState() => _TimeMachineState();
}

class _TimeMachineState extends State<TimeMachine> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1 / 1.6, // Set the desired aspect ratio here
      ),
      shrinkWrap: true, // 添加 shrinkWrap 属性
      padding: EdgeInsets.zero, // 添加 padding 属性
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            const AspectRatio(
              aspectRatio: 1 / 1.6,
              child: Image(
                image: AssetImage('assets/images/material/details2.png'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                left: 10,
                bottom: 5,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // 添加模糊效果
                    child: Container(
                      child: const Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.play,
                            size: 14,
                            color: Color.fromARGB(255, 236, 236, 236),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '22',
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 236, 236)),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        );
      },
    ));
  }
}
