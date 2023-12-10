import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/data/fitness_app_theme.dart';
import 'package:style_trend_talk/data/main_tab.dart';

TextStyle textStyles = const TextStyle(
    color: Color.fromARGB(255, 75, 75, 75),
    fontSize: 14,
    fontWeight: FontWeight.w500);

TextStyle textStylesCoins = const TextStyle(
    color: Color.fromARGB(255, 75, 75, 75),
    fontSize: 15,
    fontWeight: FontWeight.w600);

class ProfileHeader extends StatefulWidget {
  const ProfileHeader(
      {super.key, required this.scrollController, required this.callBack});
  final ScrollController scrollController;
  final void Function(String) callBack;
  @override
  State<ProfileHeader> createState() => ProfileHeaderState();
}

class ProfileHeaderState extends State<ProfileHeader>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: ProfileSliverPersistentHeaderDelegate(
        minHeight: 100,
        maxHeight: 600,
        child:
            (BuildContext context, double shrinkOffset, bool overlapsContent) {
          return const TrendProfileController();
        },
      ),
      pinned: true,
    );
  }
}

class ProfileSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Function child;

  ProfileSliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Opacity(
      opacity: 1,
      child:
          SizedBox.expand(child: child(context, shrinkOffset, overlapsContent)),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true; // 始终返回true，以便在滑动时不断重建
  }
}

class TrendProfileController extends StatefulWidget {
  const TrendProfileController({super.key});

  @override
  State<TrendProfileController> createState() => _TrendProfileControllerState();
}

class _TrendProfileControllerState extends State<TrendProfileController> {
  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final queryScreenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 300,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/profile/profile.png'),
                    fit: BoxFit.cover),
              ),
            )),
        ...List.generate(listProfile.length, (index) {
          return Positioned(
              bottom: listProfile[index]['btn'],
              child: Opacity(
                opacity: 1,
                child: Container(
                  height: 50,
                  width: queryScreenWidth,
                  color: FitnessAppTheme.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        listProfile[index]['icon'],
                        color: const Color.fromARGB(255, 151, 151, 151),
                        size: 14,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(listProfile[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 2, 2, 2),
                                      fontWeight: FontWeight.w500)),
                              Text(listProfile[index]['title'],
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 151, 151, 151))),
                            ]),
                      ),
                      const SizedBox(width: 5),
                      const Icon(FontAwesomeIcons.angleRight,
                          size: 14, color: Color.fromARGB(255, 151, 151, 151))
                    ],
                  ),
                ),
              ));
        }),
        Positioned(
            bottom: 200,
            child: Container(
              width: queryScreenWidth,
              color: FitnessAppTheme.white,
              child: Column(children: [
                // const UserContact(),
                Container(
                  height: 52,
                  padding: const EdgeInsets.only(left: 85, right: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UserContact(),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.shieldHalved,
                            size: 18,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            FontAwesomeIcons.qrcode,
                            size: 18,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '25 Coins',
                        style: textStylesCoins,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '47 Points',
                        style: textStylesCoins,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _userTags(),
                      _userTags(),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: const Text(
                      'Our lives are streams,\nflowing into the same river, \ntowards whatever heaven lies in the mist beyond the falls…Close your eyes, let the waters take you home.',
                      style: TextStyle(
                          color: Color.fromARGB(255, 110, 110, 110),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis, // 设置为省略号
                    )),
                Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
                  child: Row(
                    children: [
                      Text(
                        '2125 Likes',
                        style: textStyles,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '22 Following',
                        style: textStyles,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '2122 Followers',
                        style: textStyles,
                      ),
                    ],
                  ),
                ),
              ]),
            )),
        _userImg()
      ],
    );
  }

  Container _userTags() {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 236, 236, 236),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Row(
        children: [
          Icon(
            FontAwesomeIcons.link,
            size: 10,
            color: Color.fromARGB(255, 150, 150, 150),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Figing',
            style: TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 150, 150, 150)),
          )
        ],
      ),
    );
  }

  Positioned _userImg() {
    return Positioned(
        bottom: 388,
        left: 20,
        child: AnimatedOpacity(
            duration: duration,
            // opacity: _opacityAnimation.value,
            opacity: 1,
            child: _imgWidget(70, 70)));
  }

  Container _imgWidget(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          image: const DecorationImage(
              image: AssetImage('assets/images/profile/user.png'))),
    );
  }
}

class UserContact extends StatelessWidget {
  const UserContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            Text(
              'Alan Wark',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              FontAwesomeIcons.link,
              size: 16,
              color: Color.fromARGB(255, 255, 210, 141),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.twitter,
              size: 16,
              color: Colors.blue,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              FontAwesomeIcons.instagram,
              size: 16,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              FontAwesomeIcons.github,
              size: 16,
              color: Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              FontAwesomeIcons.facebook,
              size: 16,
              color: Colors.blue,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              FontAwesomeIcons.dribbble,
              size: 16,
              color: Color.fromARGB(255, 255, 80, 185),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              FontAwesomeIcons.tiktok,
              size: 16,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ]),
    );
  }
}
