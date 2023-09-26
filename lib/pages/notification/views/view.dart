import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("NotificationPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      id: "notification",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("notification")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
