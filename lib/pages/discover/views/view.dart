import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("DiscoverPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      init: DiscoverController(),
      id: "discover",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("discover")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
