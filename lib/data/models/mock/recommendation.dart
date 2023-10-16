Future<dynamic> getRecommendation(int page) async {}

/*
  description type : string
  0 纯文案
  1 单图片 或 单视频 
  2 大于 一张 小于 六张的图片
  3 等于大于六张
*/
List<Map<String, dynamic>> recommendationList = [
  {
    'user_name': 'Join Asx',
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
    'user_name': 'Jfde Afl',
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
