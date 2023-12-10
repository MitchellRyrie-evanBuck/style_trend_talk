import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Tab> listTabs = [
  const Tab(text: '时光机'),
  const Tab(text: '视频'),
  const Tab(text: '图片'),
  const Tab(text: '点赞'),
  const Tab(text: '收藏'),
];

final List<Map<String, dynamic>> listProfile = [
  {
    'name': '数据资产',
    'icon': FontAwesomeIcons.asterisk,
    'title': '管理我的数据资产',
    'route': '/profile/info',
    'desc': '',
    'btn': 150.0
  },
  {
    'name': '基础信息',
    'icon': FontAwesomeIcons.user,
    'title': '填写信息',
    'route': '/profile/info',
    'desc': '',
    'btn': 100.0
  },
  {
    'name': '清单',
    'icon': FontAwesomeIcons.sun,
    'title': '---',
    'route': '/profile/info',
    'desc': '',
    'btn': 50.0
  },
  {
    'name': '我的相关',
    'icon': FontAwesomeIcons.hand,
    'title': '访客记录  私藏',
    'route': '/profile/info',
    'desc': '',
    'btn': 0.0
  },
];
