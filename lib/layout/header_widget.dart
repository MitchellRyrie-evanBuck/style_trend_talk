import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100); // 设置首选高度

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Custom  Example'),
    );
  }
}
