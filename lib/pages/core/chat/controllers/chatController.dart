import 'package:get/get.dart';
import 'package:style_trend_talk/data/models/mock/chat.dart';

class ChartController extends GetxController {
  ChartController();

  final RxInt currentIndex = RxInt(0);

  late RxList<ChartModel> chartList = RxList<ChartModel>([]);

  _initData() {
    // 先去获取十条视频
    getChartInfoList();
    update(["chart"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  Future<void> getChartInfoList() async {
    // print('开始调用  objects: ----> ${chartList.value} ');

    try {
      // 调用你的API获取数据，这里使用假数据 discoverItems 代替
      List<ChartModel> newList = await getChartList(1, 10);
      print('开始调用  objects: ----> ${newList} ');

      // 将新的数据添加到之前的数组中
      chartList.addAll(newList);

      // 更新UI
      update(["chart"]);
    } catch (e) {
      // 处理异常
      print("Error fetching discover list: $e");
    }
  }

  @override
  void onReady() {
    super.onReady();
    // _initData();
  }

  @override
  void onClose() {
    chartList = RxList<ChartModel>([]);
    print('objects: ----> ${chartList} ');
    super.onClose();
  }
}
