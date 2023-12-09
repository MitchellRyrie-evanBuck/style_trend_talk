import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class TrendPage extends GetView<TrendController> {
  const TrendPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("TrendPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrendController>(
      init: TrendController(),
      id: "trend",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("trend")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
