import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  late final RxBool volume = false.obs;
  late final RxString currentPlayingVideoId = ''.obs;

  _initData() {
    update(["home"]);
  }

  void onTap() {}

  void setVolume(bool value) {
    volume.value = value;
  }

  void setVideoId(String value) {
    currentPlayingVideoId.value = value;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
