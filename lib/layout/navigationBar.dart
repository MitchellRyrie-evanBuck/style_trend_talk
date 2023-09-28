import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:style_trend_talk/store/tab_index.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    final tabIndexController = Get.put(TabIndexController());

    return GetBuilder<TabIndexController>(
      builder: (controller) {
        return BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.discord),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.comment),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: 'Profile',
            ),
          ],
          currentIndex: tabIndexController.index.value,
          onTap: (index) async {
            print('index: $index');
            await tabIndexController.setIndex(index);
          },
        );
      },
    );
  }
}
