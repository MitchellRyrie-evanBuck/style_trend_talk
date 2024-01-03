import 'package:style_trend_talk/data/index.dart';

class ChartModel {
  final String userName;
  final String userId;
  final int id;
  final String userImg;
  final String createTimer;
  final String updateTimer;
  final String? video;
  final List<String>? photo;
  final String text;

  ChartModel({
    required this.userName,
    required this.userId,
    required this.id,
    required this.userImg,
    required this.createTimer,
    required this.updateTimer,
    this.video,
    this.photo,
    required this.text,
  });
  ChartModel.fromMap(Map<String, dynamic> data)
      : userName = data['user_name'],
        userId = data['user_id'],
        id = data['id'],
        userImg = data['user_img'],
        createTimer = data['create_timer'],
        updateTimer = data['update_timer'],
        video = data['vedio'],
        photo = data['photo'] != null
            ? List<String>.from(data['photo'])
            : <String>[],
        text = data['text'];
}

// // 源数据
// List<ChartModel> recommendationListSource = recommendationList
//     .map((data) => ChartModel.fromMap(data))
//     .toList();

//
List<ChartModel> chartsItems = List.generate(10, (index) {
  return ChartModel(
    userName: generateRandomString(10),
    userId: generateRandomUUID(),
    id: getRandomByID(),
    userImg: 'assets/images/user/user1.png',
    createTimer: '2023-10-10',
    updateTimer: '2023-10-10',
    video: getRandomStringOrNull(videoFilesPaths, 10),
    photo: getRandomItems(random.nextInt(10), userListPath),
    text: getRandomText(),
  );
});

Future<List<ChartModel>> getChartList(page, pageSize) async {
  // ignore: avoid_print
  return chartsItems;
}
