import 'dart:math';

Future<dynamic> getRecommendation(int page) async {}
final random = Random();

class RecommendationModel {
  final String userName;
  final int userId;
  final String userImg;
  final bool flow;
  final bool flowSelf;
  final String desc;
  final int like;
  final bool likeSelf;
  final int star;
  final bool starSelf;
  final int share;
  final String createTimer;
  final String updateTimer;
  final int type;
  final String? video;
  final List<String>? photo;
  final String text;
  final List<String> mentions;

  RecommendationModel({
    required this.userName,
    required this.userId,
    required this.userImg,
    required this.flow,
    required this.flowSelf,
    required this.desc,
    required this.like,
    required this.likeSelf,
    required this.star,
    required this.starSelf,
    required this.share,
    required this.createTimer,
    required this.updateTimer,
    required this.type,
    this.video,
    this.photo,
    required this.text,
    required this.mentions,
  });
  RecommendationModel.fromMap(Map<String, dynamic> data)
      : userName = data['user_name'],
        userId = data['user_id'],
        userImg = data['user_img'],
        flow = data['flow'],
        flowSelf = data['flow_self'],
        desc = data['desc'],
        like = data['like'],
        likeSelf = data['like_self'],
        star = data['star'],
        starSelf = data['star_self'],
        share = data['share'],
        createTimer = data['create_timer'],
        updateTimer = data['update_timer'],
        type = data['type'],
        video = data['vedio'],
        photo = data['photo'] != null
            ? List<String>.from(data['photo'])
            : <String>[],
        text = data['text'],
        mentions = List<String>.from(data['@']);
}

// // 源数据
// List<RecommendationModel> recommendationListSource = recommendationList
//     .map((data) => RecommendationModel.fromMap(data))
//     .toList();

List<String> pathList = [
  'assets/images/material/details1.png',
  'assets/images/material/details2.png',
  'assets/images/material/details3.png',
  'assets/images/material/details4.png',
  'assets/images/material/details5.png',
  'assets/images/material/details6.png',
  'assets/images/material/details7.png',
  'assets/images/material/details8.png',
  'assets/images/material/桌面壁纸.png',
  'assets/images/material/fifth.png',
  'assets/images/material/first.png',
  'assets/images/material/fourth.png',
  'assets/images/material/third.png',
];

List<String> videoFilesPaths = [
  'assets/video/sea.mov',
  'assets/video/rush.mp4',
];

List<String> userListPath = List.generate(28, (index) {
  return 'assets/images/user/user${index + 1}.png';
});

//
List<RecommendationModel> items = List.generate(10, (index) {
  return RecommendationModel(
    userName: generateRandomString(10),
    userId: 412325,
    userImg: getRandomUserImgs(userListPath, 10),
    flow: true,
    flowSelf: true,
    desc:
        'Life was like a box of chocolates, you never know what you going to get.',
    like: 123,
    likeSelf: true,
    star: 234,
    starSelf: false,
    share: 987,
    createTimer: '2023-10-10',
    updateTimer: '2023-10-10',
    type: 1,
    video: getRandomStringOrNull(videoFilesPaths),
    photo: getRandomItems(random.nextInt(10), userListPath),
    text:
        'Life was like a box of chocolates, you never know what you going to get.o',
    mentions: getRandomItems(3, userListPath),
  );
});

// 生成随机字符串的函数
String generateRandomString(int length) {
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
}

/*
  @deprecated 生成随机数据
*/
List<T> getRandomItems<T>(int count, List<T> sourceList) {
  if (count > sourceList.length) {
    return sourceList;
  }
  var random = Random();
  var resultList = <T>[];
  while (resultList.length < count) {
    var randomIndex = random.nextInt(sourceList.length);
    var randomItem = sourceList[randomIndex];
    if (!resultList.contains(randomItem)) {
      resultList.add(randomItem);
    }
  }
  return resultList;
}

/*
  @deprecated 生成随机数据
*/
String getRandomUserImgs(List sourceList, int nums) {
  return sourceList[random.nextInt(nums)];
}

Future<List<RecommendationModel>> getBeerList(page, pageSize) async {
  // ignore: avoid_print
  return items;
}

String? getRandomStringOrNull(List<String> stringList) {
  // 生成一个随机数，范围为0到3
  int randomIndex = Random().nextInt(10);

  // 如果随机数为0，则返回数组中的随机字符串；否则返回null
  return (randomIndex <= 4)
      ? stringList[Random().nextInt(stringList.length)]
      : null;
}
