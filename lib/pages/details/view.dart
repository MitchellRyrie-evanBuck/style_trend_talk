import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("DetailsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      init: DetailsController(),
      id: "details",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("details")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
