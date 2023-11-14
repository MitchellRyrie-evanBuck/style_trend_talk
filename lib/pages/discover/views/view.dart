import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 3, 3, 3)),
      child: const Stack(children: []),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      init: DiscoverController(),
      id: "discover",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }
}
