import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:style_trend_talk/widget/progressIndicatorWidget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecommendTabPage extends StatefulWidget {
  const RecommendTabPage({super.key});

  @override
  State<RecommendTabPage> createState() => _RecommendTabPageState();
}

List<String> items = List.generate(3, (index) => 'Item $index');

class _RecommendTabPageState extends State<RecommendTabPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 100),
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemCount: items.length + 1, // Add 1 for load more indicator
      itemBuilder: (context, index) {
        if (index < items.length) {
          return RecommendItemDetails(index: index);
        } else if (index == items.length) {
          // Load more indicator
          return const ProgressIndicatorWidget();
        }
        return null;
      },
    );
  }
}

class RecommendItemDetails extends StatefulWidget {
  const RecommendItemDetails({super.key, required this.index});
  final int index;
  @override
  State<RecommendItemDetails> createState() => _RecommendItemDetailsState();
}

class _RecommendItemDetailsState extends State<RecommendItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        _UserDescribe(),
        _ImgContextWidget(),
        _DescribeWidget(),
        _TagWidget(),
        _LikeOrStarWidget(),
        _TimeContainer(),
      ]),
    );
  }

  Container _TimeContainer() {
    return Container(
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: const Row(
          children: [
            Text(
              '2 hours ago',
              style: TextStyle(
                  color: Color.fromARGB(255, 102, 102, 102), fontSize: 12),
            )
          ],
        ));
  }

  Container _LikeOrStarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      height: 44,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _IconNum(
              icon: FontAwesomeIcons.heart,
              nums: '1.2k',
            ),
            const SizedBox(
              width: 20,
            ),
            const _IconNum(
              icon: FontAwesomeIcons.star,
              nums: '1.2k',
            ),
            const SizedBox(
              width: 20,
            ),
            const _IconNum(
              icon: FontAwesomeIcons.comment,
              nums: '1.2k',
            ),
            const SizedBox(
              width: 20,
            ),
            const _IconNum(
              icon: FontAwesomeIcons.shareFromSquare,
              nums: '1.2k',
            ),
            const Spacer(),
            _UserImagesDetailsWidget(),
            const Icon(
              FontAwesomeIcons.ellipsisVertical,
              size: 18,
              color: Color.fromARGB(255, 102, 102, 102),
            ),
          ]),
    );
  }

  Container _UserImagesDetailsWidget() {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: const Stack(alignment: AlignmentDirectional.centerEnd, children: [
        _ImgCircles(
          left: 0,
          imgPath: 'assets/images/recommend/avtr.png',
        ),
        _ImgCircles(
          left: 20,
          imgPath: 'assets/images/recommend/avtr.png',
        ),
        _ImgCircles(
          left: 40,
          imgPath: 'assets/images/recommend/avtr.png',
        ),
      ]),
    );
  }

  Container _UserDescribe() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/images/recommend/avtr.png'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Audrey Hail',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: AutofillHints.birthdayDay),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Follow',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Harvard University',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          const Icon(
            FontAwesomeIcons.ellipsis,
            size: 18,
            color: Color.fromARGB(255, 102, 102, 102),
          )
        ],
      ),
    );
  }

  Expanded _ImgContextWidget() {
    late List<String> _listImg = [
      'assets/images/recommend/avtr.png',
      'assets/images/recommend/avtr.png',
      'assets/images/recommend/avtr.png',
    ];
    return Expanded(
        child: Container(
            color: Colors.transparent,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                childAspectRatio: 1.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _listImg.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 140,
                    color: Colors.blue,
                    child: Image(
                      image: AssetImage(_listImg[index]),
                      fit: BoxFit.cover,
                    ));
              },
            )

            // MasonryGridView.count(
            //   crossAxisCount: 3,
            //   mainAxisSpacing: 3,
            //   crossAxisSpacing: 3,
            //   shrinkWrap: true,
            //   scrollDirection: Axis.vertical,
            //   itemCount: _listImg.length,
            //   semanticChildCount: _listImg.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //         height: 140,
            //         color: Colors.blue,
            //         child: Image(
            //           image: AssetImage(_listImg[index]),
            //           fit: BoxFit.cover,
            //         ));
            //   },
            // ),
            ));
  }

  Container _DescribeWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: const Text(
        'Life was like a box of chocolates, you never know what you going to get.',
        style: TextStyle(color: Color.fromARGB(255, 54, 54, 54), fontSize: 14),
      ),
    );
  }

  Container _TagWidget() {
    late List<String> tagList = ['Movie', 'Classis ines'];
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: tagList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            child: Text(tagList[index],
                style: const TextStyle(color: Colors.black, fontSize: 10)),
          );
        },
      ),
    );
  }
}

class _IconNum extends StatelessWidget {
  const _IconNum({super.key, required this.icon, required this.nums});
  final IconData? icon;
  final String nums;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color.fromARGB(255, 102, 102, 102),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          nums,
          style: const TextStyle(
              color: Color.fromARGB(255, 102, 102, 102), fontSize: 12),
        )
      ],
    );
  }
}

class _ImgCircles extends StatelessWidget {
  const _ImgCircles({super.key, required this.left, required this.imgPath});
  final double? left;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: 5,
        child: Container(
          width: 30, // 设置头像的宽度
          height: 30, // 设置头像的高度
          decoration: BoxDecoration(
            shape: BoxShape.circle, // 将容器形状设置为圆形
            border: Border.all(
              color: Color.fromARGB(255, 255, 255, 255), // 边框颜色
              width: 3.0, // 边框宽度
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              imgPath, // 头像图片的路径
              fit: BoxFit.cover, // 图片适应方式
            ),
          ),
        ));
  }
}
