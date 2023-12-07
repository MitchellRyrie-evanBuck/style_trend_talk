import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/pages/core/search/widget/header.dart';

class SeniorSearch extends StatefulWidget {
  const SeniorSearch({super.key});

  @override
  State<SeniorSearch> createState() => _SearchState();
}

class _SearchState extends State<SeniorSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SearchAppHeader(),
            SliverAnimatedList(
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Container(
                    height: 50,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 16,
                          color: Color.fromARGB(255, 182, 182, 182),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '有志者事竟成',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          FontAwesomeIcons.turnUp,
                          size: 16,
                          color: Color.fromARGB(255, 182, 182, 182),
                        ),
                      ],
                    ),
                  ),
                );
              },
              initialItemCount: 5,
            ),
            // SliverFillRemaining(
            //   child: Container(
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
