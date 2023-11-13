import 'package:style_trend_talk/data/index.dart';

class NotifierTionListModel {
  final String avatarUrl; // 用户头像
  final String name; // 用户名
  final String lastMessage; // 最新的消息
  final String lastMessageTime; // 最新消息的时间
  final bool isOnline; // 在线状态
  final int unreadMessages; // 未读消息数
  final int userId;

  NotifierTionListModel({
    required this.avatarUrl,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    required this.unreadMessages,
    required this.userId,
  });
}

List<NotifierTionListModel> notifierTionItems = List.generate(10, (index) {
  return NotifierTionListModel(
    name: generateRandomString(10),
    userId: 412325,
    avatarUrl: getRandomUserImgs(userListPath, 10),
    lastMessage: '',
    lastMessageTime: '',
    isOnline: false,
    unreadMessages: 99,
  );
});

Future<List<NotifierTionListModel>> getNotifiertionList(page, pageSize) async {
  // ignore: avoid_print
  return notifierTionItems;
}
