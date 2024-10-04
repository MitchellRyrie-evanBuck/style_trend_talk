import 'index.dart';

List<String> textList = [
  'Our lives are streams,flowing into the same river, towards whatever heaven lies in the mist beyond the falls…Close your eyes, let the waters take you home.',
  'Using a widget function instead of a widget fully guarantees',
  'Life was like a box of chocolates, you never know what you going to get.o',
  '只有热爱你所做的事情，才能做出伟大的工作。',
  'The only way to do great work is to love what you do.',
  '世界上最好、最美丽的东西是看不见的，甚至是摸不到的 - 它们必须用心去感受',
  'The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.',
  '我们对明天的实现的唯一限制将是我们今天的怀疑',
  'The only limit to our realization of tomorrow will be our doubts of today.',
  'The greatest glory in living lies not in never falling, but in rising every time we fall.',
  '人生最大的荣耀不在于永不跌倒，而在于每一次跌倒后都能够重新站起来。',
  'Freedom is the ability to do what you want, say what you want, and love who you want',
  'Im going to be myself, no matter what anyone says',
  '自由是创造的源泉，我们要用它来创造美好的生活',
  '自由是每个人的权利，我们要为它而奋斗',
  '自由是无价的，我们要珍惜它',
  'Freedom is the companion of responsibility, and we should be responsible for our own freedom..',
];

String getRandomText() {
  return textList[random.nextInt(textList.length)];
}
