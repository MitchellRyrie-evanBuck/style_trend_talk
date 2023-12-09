import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // 处理抽屉中的选项点击事件
              Navigator.pop(context); // 关闭抽屉
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // 处理抽屉中的选项点击事件
              Navigator.pop(context); // 关闭抽屉
            },
          ),
          // 添加其他抽屉选项
        ],
      ),
    );
  }
}
