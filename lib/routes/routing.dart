import 'package:get/get.dart';

import 'package:style_trend_talk/pages/index.dart';

final List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => LoginPage()),
  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/discover', page: () => const DiscoverPage()),
  GetPage(name: '/notification', page: () => const NotificationPage()),
  GetPage(name: '/profile', page: () => const ProfilePage()),
  GetPage(name: '/profile', page: () => const ProfilePage()),

  // 添加其他路由和详情页的GetPage
];
