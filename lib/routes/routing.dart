import 'package:get/get.dart';

import 'package:style_trend_talk/pages/index.dart';

final List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/main', page: () => MainPage()),
  GetPage(name: '/discover', page: () => const DiscoverPage()),
  GetPage(name: '/notification', page: () => const NotificationPage()),
  GetPage(name: '/profile', page: () => const ProfilePage()),
  // 添加其他路由和详情页的GetPage
];

final List routing = [
  MainPage(),
  const DiscoverPage(),
  const NotificationPage(),
  const ProfilePage(),
];
