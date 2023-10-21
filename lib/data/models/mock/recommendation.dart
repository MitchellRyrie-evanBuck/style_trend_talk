import 'dart:math';

Future<dynamic> getRecommendation(int page) async {}

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

/*
  description type : string
  0 纯文案
  1 单图片 或 单视频 
  2 大于 一张 小于 六张的图片
  3 等于大于六张
*/

List recommendationList = [
  {
    'user_name': generateRandomString(10),
    'user_id': 341232,
    'user_img': 'assets/images/material/user1.png',
    'flow': true,
    'flow_self': true,
    'desc': '有志者事竟成',
    'like': 123,
    'like_self': true,
    'star': 234,
    'star_self': false,
    'share': 987,
    'create_timer': '2023-10-10',
    'update_timer': '2023-10-10',
    'type': 2, // 0 1 ,2, 3 ，4 ，5
    'vedio': null,
    'photo': [
      'assets/images/material/details1.png',
      'assets/images/material/details2.png',
      'assets/images/material/details3.png'
    ],
    'text': 'lemo lemo lemo lemo lemo lemo lemo lemo lemo lemo lemo lemo',
    '@': []
  },
  {
    'user_name': generateRandomString(7),
    'user_id': 34122232,
    'user_img': 'assets/images/material/user1.png',
    'flow': true,
    'flow_self': true,
    'desc': '有志者事竟成',
    'like': 123,
    'like_self': true,
    'star': 234,
    'star_self': false,
    'share': 987,
    'create_timer': '2023-10-10',
    'update_timer': '2023-10-10',
    'type': 0, // 0 1 ,2, 3 ，4 ，5
    'vedio': null,
    'photo': null,
    'text': 'lemo lemo lemo lemo lemo lemo lemo lemo lemo lemo lemo lemo',
    '@': []
  },
  {
    'user_name': 'Anfu Tom',
    'user_id': 1341232,
    'user_img': 'assets/images/material/user2.png',
    'flow': true,
    'flow_self': true,
    'desc':
        'Life was like a box of chocolates, you never know what you going to get.',
    'like': 123,
    'like_self': true,
    'star': 234,
    'star_self': false,
    'share': 987,
    'create_timer': '2023-10-10',
    'update_timer': '2023-10-10',
    'type': 1, // 1 ,2, 3
    'vedio': 'assets/video/sea.mov',
    'photo': [],
    'text':
        'Life was like a box of chocolates, you never know what you going to get.o',
    '@': []
  },
  {
    'user_name': 'Anfu... Tom',
    'user_id': 41232,
    'user_img': 'assets/images/material/user3.png',
    'flow': true,
    'flow_self': true,
    'desc':
        'Life was like a box of chocolates, you never know what you going to get.',
    'like': 123,
    'like_self': true,
    'star': 234,
    'star_self': false,
    'share': 987,
    'create_timer': '2023-10-10',
    'update_timer': '2023-10-10',
    'type': 3, // 1 ,2, 3
    'vedio': null,
    'photo': [
      'assets/images/material/details1.png',
      'assets/images/material/details2.png',
      'assets/images/material/details3.png',
      'assets/images/material/details4.png',
      'assets/images/material/details5.png',
      'assets/images/material/details6.png'
    ],
    'text':
        'Life was like a box of chocolates, you never know what you going to get.o',
    '@': []
  },
  {
    'user_name': 'Aenfu... Tom',
    'user_id': 412325,
    'user_img': 'assets/images/material/user3.png',
    'flow': true,
    'flow_self': true,
    'desc':
        'Life was like a box of chocolates, you never know what you going to get.',
    'like': 123,
    'like_self': true,
    'star': 234,
    'star_self': false,
    'share': 987,
    'create_timer': '2023-10-10',
    'update_timer': '2023-10-10',
    'type': 1, // 1 ,2, 3
    'vedio': null,
    'photo': [
      'assets/images/material/details1.png',
    ],
    'text':
        'Life was like a box of chocolates, you never know what you going to get.o',
    '@': []
  },
];

List<RecommendationModel> recommendationListSource = recommendationList
    .map((data) => RecommendationModel.fromMap(data))
    .toList();

List<RecommendationModel> items = List.generate(10, (index) {
  return RecommendationModel(
    userName: generateRandomString(10),
    userId: 412325,
    userImg: 'assets/images/material/user3.png',
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
    video: null,
    photo: ['assets/images/material/details1.png'],
    text:
        'Life was like a box of chocolates, you never know what you going to get.o',
    mentions: [],
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
