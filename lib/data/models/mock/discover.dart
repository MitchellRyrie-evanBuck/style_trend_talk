import 'package:style_trend_talk/data/index.dart';

Future<dynamic> getRecommendation(int page) async {}

class DiscoverModel {
  final String userName;
  final String userId;
  final String id;
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

  DiscoverModel({
    required this.userName,
    required this.userId,
    required this.id,
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
  DiscoverModel.fromMap(Map<String, dynamic> data)
      : userName = data['user_name'],
        userId = data['user_id'],
        id = data['id'],
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
// List<DiscoverModel> recommendationListSource = recommendationList
//     .map((data) => DiscoverModel.fromMap(data))
//     .toList();

//
List<DiscoverModel> discoverItems = List.generate(10, (index) {
  return DiscoverModel(
    userName: generateRandomString(10),
    userId: generateRandomUUID(),
    id: generateRandomUUID(),
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
    video: getRandomStringOrNull(videoFilesPaths, 10),
    photo: getRandomItems(random.nextInt(10), userListPath),
    text:
        'Life was like a box of chocolates, you never know what you going to get.o',
    mentions: getRandomItems(3, userListPath),
  );
});

Future<List<DiscoverModel>> getDiscoverList(page, pageSize) async {
  // ignore: avoid_print
  return discoverItems;
}
