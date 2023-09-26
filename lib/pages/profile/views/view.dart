import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ProfilePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("profile")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
