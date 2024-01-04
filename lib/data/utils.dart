// 生成随机字符串的函数
// import 'dart:ffi';
import 'dart:math';

import 'package:uuid/uuid.dart';

final random = Random();

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
String getRandomUserImgs(
  List sourceList,
  int nums,
) {
  return sourceList[random.nextInt(nums)];
}

String? getRandomStringOrNull(List<String> stringList, int probability) {
  // 生成一个随机数，范围为0到3
  int randomIndex = Random().nextInt(10);

  // 如果随机数为0，则返回数组中的随机字符串；否则返回null
  return (randomIndex <= probability)
      ? stringList[Random().nextInt(stringList.length)]
      : null;
}

String generateRandomUUID() {
  const uuid = Uuid();
  return uuid.v4();
}

int getRandomByID() {
  // 生成一个随机数，范围为0到3
  int randomIndex = Random().nextInt(10);

  // 如果随机数为0，则返回数组中的随机字符串；否则返回null
  return randomIndex <= 3 ? 1 : 2;
}
