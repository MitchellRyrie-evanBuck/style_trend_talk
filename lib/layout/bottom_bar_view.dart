import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/data/tabIcon_data.dart';
// import 'package:style_trend_talk/hooks/index.dart';
import 'package:style_trend_talk/store/tab_index.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView(
      {Key? key, this.tabIconsList, this.changeIndex, this.addClick})
      : super(key: key);

  final Function(int index)? changeIndex;
  final Function()? addClick;
  final List<TabData>? tabIconsList;
  @override
  // ignore: library_private_types_in_public_api
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  // late AnimationController atController;
  // late Animation<Color?> atColorAnimation;
  final tabIndexController = Get.put(TabIndexController());
  final index = Get.find<TabIndexController>().index;

  Alignment alibegin = Alignment.topLeft;
  Alignment aliend = Alignment.bottomRight;
  final List<Color> _colors = [
    Colors.black,
    Colors.grey,
    const Color.fromARGB(255, 91, 122, 135)
  ];
  int _currentColorIndex = 0;

  bool isBtnFloat = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController?.forward();
    _startAnimation();
    super.initState();
  }

  void _startAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        alibegin = _generateRandomAlignment();
        aliend = _generateRandomAlignment();
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
      _startAnimation();
    });
  }

  Alignment _generateRandomAlignment() {
    final random = Random();
    final alignments = [
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomLeft,
      Alignment.bottomRight,
    ];

    Alignment start, end;

    do {
      start = alignments[random.nextInt(alignments.length)];
      end = alignments[random.nextInt(alignments.length)];
    } while (start == end);

    return start;
  }

  @override
  void dispose() {
    animationController?.dispose();
    // atController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<TabIndexController>(
    //   builder: (_) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: index.value == 1
                    ? FitnessAppTheme.btnBlack
                    : FitnessAppTheme.white,
                elevation: 10.0,
                clipper: TabClipper(
                    radius: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(CurvedAnimation(
                                parent: animationController!,
                                curve: Curves.fastOutSlowIn))
                            .value *
                        // 38.0),
                        (isBtnFloat ? 38.0 : 0)),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      height: 48,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: TabIcons(
                              tabData: widget.tabIconsList?[0],
                              changeIndex: widget.changeIndex,
                            )),
                            Expanded(
                                child: TabIcons(
                              tabData: widget.tabIconsList?[1],
                              changeIndex: widget.changeIndex,
                            )),
                            SizedBox(
                              width: Tween<double>(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animationController!,
                                          curve: Curves.fastOutSlowIn))
                                      .value *
                                  77.0,
                            ),
                            Expanded(
                                child: TabIcons(
                              tabData: widget.tabIconsList?[2],
                              changeIndex: widget.changeIndex,
                            )),
                            Expanded(
                                child: TabIcons(
                              tabData: widget.tabIconsList?[3],
                              changeIndex: widget.changeIndex,
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          },
        ),
        isBtnFloat
            ? Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: SizedBox(
                  width: 38 * 2.0,
                  height: 38 + 48.0,
                  child: Container(
                      alignment: Alignment.topCenter,
                      color: Colors.transparent,
                      child: AnimatedBuilder(
                          animation: animationController!,
                          builder: (BuildContext context, Widget? child) {
                            return _btnContaienrAT();
                          })),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: Container(
                    width: 40,
                    height: 48,
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: AnimatedBuilder(
                        animation: animationController!,
                        builder: (BuildContext context, Widget? child) {
                          return IconButton(
                              onPressed: widget.addClick,
                              icon: Icon(
                                FontAwesomeIcons.squarePlus,
                                size: 28,
                                color: index.value != 1
                                    ? Colors.black
                                    : Colors.white,
                              ));
                        })),
              ),
      ],
    );
    //   },
    // );
  }

  SizedBox _btnContaienrAT() {
    return SizedBox(
      width: 38 * 2.0,
      height: 38 * 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: animationController!, curve: Curves.fastOutSlowIn)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInToLinear,
            decoration: BoxDecoration(
              color: index.value != 1
                  ? FitnessAppTheme.controllerBg
                  : FitnessAppTheme.controllerBgNight,
              // gradient: LinearGradient(
              //   colors: _colors.sublist(_currentColorIndex) +
              //       _colors.sublist(0, _currentColorIndex),
              //   begin: alibegin,
              //   end: aliend,
              // ),
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                    offset: const Offset(8.0, 16.0),
                    blurRadius: 16.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.1),
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: widget.addClick,
                child: Icon(
                  // FontAwesomeIcons.pushed,
                  FontAwesomeIcons.squarePlus,

                  color: index.value != 1
                      ? FitnessAppTheme.white
                      : FitnessAppTheme.btnNotCheck,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({super.key, required this.tabData, required this.changeIndex});
  final TabData? tabData;
  final Function? changeIndex;

  @override
  State<TabIcons> createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> {
  final tabIndexController = Get.put(TabIndexController());
  final index = Get.find<TabIndexController>().index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        debugPrint('打印${widget.tabData?.index}'),
        widget.changeIndex!(widget.tabData?.index)
      },
      child: Center(child: GetBuilder<TabIndexController>(
        builder: (controller) {
          return Stack(
            children: [
              SizedBox(
                width: 60,
                height: 50,
                child: Center(
                  child: Text(
                    widget.tabData?.label ?? "",
                    style: TextStyle(
                        color: widget.tabData?.index == index.value
                            ? index.value == 1
                                ? FitnessAppTheme.white
                                : FitnessAppTheme.black
                            : index.value == 1
                                ? FitnessAppTheme.btnNotCheckNight
                                : FitnessAppTheme.btnNotCheck),
                  ),
                ),
              ),
              widget.tabData?.index == 2
                  ? Positioned(
                      top: 3,
                      right: 4,
                      child: Container(
                        height: 18,
                        width: 18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            '99',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ))
                  : const SizedBox(),
              widget.tabData?.index == 3
                  ? Positioned(
                      top: 10,
                      right: 14,
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                      ))
                  : const SizedBox()
            ],
          );
        },
      )),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
